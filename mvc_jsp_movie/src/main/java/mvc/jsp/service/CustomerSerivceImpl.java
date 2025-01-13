package mvc.jsp.service;

import java.io.IOException;
import java.sql.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import mvc.jsp.dao.CustomerDAOImpl;
import mvc.jsp.dto.CustomerDTO;

public class CustomerSerivceImpl implements CustomerService{

	@Override
	// ID 중복 확인 처리 
	public void idConfirmAction(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// -------------[3단계] 스크립트에서 get 방식으로 넘긴 값을 가져온다.-------------
		String strId = request.getParameter("user_id"); // 아이디 값만 가지고 온다.
		
		// -------------[4단계] 싱글톤 방식으로 DAO 객체 생성, 다형성 적용-------------
		CustomerDAOImpl dao = CustomerDAOImpl.getInstance();
		
		// -------------[5단계] 회원가입 처리-------------
		// dao.userIdCheck 함수 값을 selectCnt 변수에 저장한다. 		
		int selectCnt = dao.userIdCheck(strId);
		
		// -------------[6단계] jsp로 처리 결과 전달-------------
		request.setAttribute("selectCnt", selectCnt);
		request.setAttribute("strId", strId); 
	}

	@Override
	// 회원 가입 처리 
	public void signUpAction(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// -------------[3단계] 화면에서 입력받은 값을 가져와서 DTO setter를 통해 값 전달.-------------
		// [3-1] 회원 가입은 DB에 데이터를 넣어야하기 때문에 브라우저 input 데이터를 dto.set으로 데이터를 담는다. 		
		CustomerDTO dto = new CustomerDTO();
		
		dto.setUser_id(request.getParameter("user_id"));        // input name : user_id
		dto.setUser_pwd(request.getParameter("user_pwd"));      // input name : user_pwd
		dto.setUser_name(request.getParameter("user_name"));    // input name : user_name
		
		// request.getParameter는 String 타입으로 user_birth는 date 타입이므로, Date.valueOf로 형변환한다. 
		dto.setUser_birth(Date.valueOf(request.getParameter("user_birth")));  // input name : user_birth

		// 핸드폰 번호를 3개의 input이 존재하므로, 3개를 각각 변수로 받아서, 하나의 address 변수에 담는다. 
		String hp1 = request.getParameter("user_hp1");
		String hp2 = request.getParameter("user_hp2");
		String hp3 = request.getParameter("user_hp3");
		
		String phone = hp1+ "-" + hp2 + "-" + hp3;
		dto.setUser_phone(phone);
		
		// 주소는 4개의 input이 존재하므로, 4개를 각각 변수로 받아서, 하나의 address 변수에 담는다. 
		String address1 = request.getParameter("user_address1");
		String address2 = request.getParameter("user_address2");
		String address3 = request.getParameter("user_address3");
		String address4 = request.getParameter("user_address4");
		
		String address = address1 + address2 + address3 + address4;
		dto.setUser_address(address);
		
		// 이메일은 필수정보가 아니기 때문에, null이 존재할 수 있다. 
		String email1 = request.getParameter("user_email1");
		String email2 = request.getParameter("user_email2");
		
		String email = null;
		
		// 각 email1, email2의 값이 존재할 때만 받아온다. 
		if (!email1.equals("")&& !email2.equals("")) {
			email = email1 + "@"+ email2;
		}
		dto.setUser_email(email);

		// 전화번호는 필수정보가 아니기 때문에, null이 존재할 수 있다. 
		String tel1 = request.getParameter("user_tel1");
		String tel2 = request.getParameter("user_tel2");
		String tel3 = request.getParameter("user_tel3");
		
		String tel = null;

		// 각 email1, email2의 값이 존재할 때만 받아온다. 
		if(!tel1.equals("") && !tel2.equals("") && !tel3.equals("")) {
			tel = tel1 + "-" + tel2 + "-" + tel3;
		}
		
		dto.setUser_tel(tel);
		
		// -------------[4단계] 싱글톤 방식으로 DAO 객체 생성, 다형성 적용-------------
		CustomerDAOImpl dao = CustomerDAOImpl.getInstance();

		
		// -------------[5단계] 회원가입 처리-------------
		// 위에 불러온 dto 값들을 dao.insertCustmer 함수를 통해 inserCnt 변수에 저장한다. 
		int insertCnt = dao.insertCustomer(dto);
		
		// -------------[6단계] jsp로 처리 결과 전달-------------
		request.setAttribute("insertCnt", insertCnt);
		
	}

	@Override
	// 로그인 처리 
	public void loginAction(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("service - loginAction");
		// -------------[3단계] 스크립트에서 get 방식으로 넘긴 값을 가져온다.-------------
		String strId = request.getParameter("user_id"); // 아이디 값만 가지고 온다.
		String strPwd = request.getParameter("user_pwd"); // 아이디 값만 가지고 온다.
		
		// -------------[4단계] 싱글톤 방식으로 DAO 객체 생성, 다형성 적용-------------
		CustomerDAOImpl dao = CustomerDAOImpl.getInstance();
		
		// -------------[5단계] 로그인 처리-------------
		int selectCnt = dao.userIdPwdChk(strId, strPwd);
		
	    // -------------[selectCnt 값에 따라 세션 설정 및 에러 처리]------------
	    if (selectCnt == 1) { // 일반 회원
	        request.getSession().setAttribute("sessionID", strId);
	    } 
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
