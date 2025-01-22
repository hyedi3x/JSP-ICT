package mvc.jsp.service;

import java.io.IOException;
import java.sql.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import mvc.jsp.dao.CustomerDAOImpl;
import mvc.jsp.dto.CustomerDTO;

public class CustomerSerivceImpl implements CustomerService{
	
	// -------------[4단계] 싱글톤 방식으로 DAO 객체 생성, 다형성 적용-------------
	CustomerDAOImpl dao = CustomerDAOImpl.getInstance();

	@Override
	// ======================= [id 중복 확인 처리 페이지] =======================
	public void idConfirmAction(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("CustomerSerivceImpl - idConfirmAction()");

		// -------------[3단계] 스크립트에서 get 방식으로 넘긴 값을 가져온다.-------------
		String strId = request.getParameter("user_id"); // 아이디 값만 가지고 온다.
		
		// -------------[4단계] - 전역변수로 선언-------------
		// -------------[5단계] 회원가입 처리-------------
		// dao.userIdCheck 함수 값을 selectCnt 변수에 저장한다. 		
		int selectCnt = dao.userIdCheck(strId);
		
		// -------------[6단계] jsp로 처리 결과 전달-------------
		request.setAttribute("selectCnt", selectCnt);
		request.setAttribute("strId", strId); 
	}

	@Override
	// ======================= [회원가입 처리 페이지] =======================
	public void signUpAction(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("CustomerSerivceImpl - signUpAction()");

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
		
		String address = address1 + ","  + address2  + "," + address3  + "," + address4;
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
		
		// -------------[4단계] - 전역변수로 선언-------------
		// -------------[5단계] 회원가입 처리-------------
		// 위에 불러온 dto 값들을 dao.insertCustmer 함수를 통해 inserCnt 변수에 저장한다. 
		int insertCnt = dao.insertCustomer(dto);
		
		// -------------[6단계] jsp로 처리 결과 전달-------------
		request.setAttribute("insertCnt", insertCnt);
		
	}

	@Override
	// ======================= [로그인 성공 처리 페이지] =======================
	public void loginAction(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("CustomerSerivceImpl - loginAction()");

		// -------------[3단계] 화면에서 입력받은 값을 가져와서 파라미터로 담기 -------------
		String strId = request.getParameter("user_id");
		String strPwd = request.getParameter("user_pwd");
		
		// -------------[4단계] - 전역변수로 선언-------------
		// -------------[5단계] 로그인 성공여부 처리-------------
		// 아이디와 비밀번호가 일치하는지 userIdPwdChk 메서드 실행후 결과값을 selectCnt 변수에 담는다.
		int selectCnt = dao.userIdPwdChk(strId, strPwd);
				
		// -------------[6단계] - selectCnt 값에 따라 세션 설정 및 에러 처리 ------------
		// selectCnt 값에 따라 세션 설정 및 에러 처리
		// HttpSession : 세션을 생성하고, 기존 세션이 존재하면 존재하는 세션을 전달, 없는 세션이면 새롭게 세션 생성
		// request.getSession() : 컨트롤러 호출 시 세션이 존재하면 존재하는 세션을 전달, 없으면 새로 생성 또는 null 반환
		HttpSession session = request.getSession();    
		
		if (selectCnt == 1) { // 일반 회원	
			session.setAttribute("sessionID", strId);
			session.setAttribute("login_session", "Customer"); // 사용자 유형 저장
		} else if (selectCnt == 2) { // 관리자
			session.setAttribute("sessionID", strId);
			session.setAttribute("login_session", "Admin"); // 사용자 유형 저장
		}
	}
	
	@Override
	// ======================= [마이페이지 & 관리자 페이지] =======================
	public void myInfo(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("CustomerSerivceImpl - myInfo()");
		
		// -------------[3단계] 화면에서 입력받은 값을 가져와서 파라미터로 담기 -------------
		// 3-1단계. 세션에 저장된 ID를 가져와서 strId 변수에 담는다. 
		String strId = (String)request.getSession().getAttribute("sessionID");

		// -------------[4단계] - 전역변수로 선언-------------
		// -------------[5단계] 세션 정보 조회-------------
		// 세션 ID에 해당하는 dto 값들을 dao.MemberSelect 함수를 통해 info 변수에 저장한다. 
		CustomerDTO info = dao.memberSelect(strId);
		
		// -------------[6단계] jsp로 처리 결과 전달-------------
		request.setAttribute("info", info);
		
	}

	@Override
	// ======================= [마이페이지 & 관리자 페이지 수정 페이지 진입 전 비밀번호 확인(인증) 처리 페이지] =======================
	public void modifyInfoChk(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("CustomerSerivceImpl - modifyInfoChk()");

		// -------------[3단계] 화면에서 입력받은 값을 가져와서 파라미터로 담기 -------------
		// 3-1단계. 세션에 저장된 ID를 가져와서 strId 변수에 담는다. 
		String strId = (String)request.getSession().getAttribute("sessionID");
		
		// 3-2단계. 화면에서 입력받은 비밀번호를 strPwd에 변수에 담는다. 
		String strPwd = request.getParameter("user_pwd");
		
		// -------------[4단계] - 전역변수로 선언-------------
		// -------------[5단계]비밀번호 인증 처리-------------
		// 아이디와 비밀번호가 일치하는지 userIdPwdChk 메서드 실행후 결과값을 selectCnt 변수에 담는다.
		int selectCnt = dao.userIdPwdChk(strId, strPwd);
		
		// -------------[6단계] jsp로 처리 결과 전달-------------
		request.setAttribute("selectCnt", selectCnt);
	}	
	
	
	@Override
	// ======================= [마이페이지 & 관리자 페이지 수정 페이지] =======================
	public void modifyInfo(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("CustomerSerivceImpl - modifyDetailAction()");
		
		// -------------[3단계] 세션에 저장된 ID를 가져와서 strId 변수에 담는다 -------------
		String strId = (String)request.getSession().getAttribute("sessionID");
		
		// -------------[4단계] - 전역변수로 선언-------------
		// -------------[5단계] 상세페이지 (회원 정보 인증 성공시)
		// 세션 ID에 해당하는 dto 값들을 dao.MemberSelect 함수를 통해 info 변수에 저장한다. 
		CustomerDTO info = dao.memberSelect(strId);
		
		// -------------[6단계] jsp로 처리 결과 전달-------------
		request.setAttribute("info", info);

	}

	@Override
	// 회원정보 인증 후 수정처리
	public void modifyInfoAction(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("CustomerSerivceImpl - modifyInfoAction()");
		
		// -------------[3단계] 화면에서 입력받은 값을 가져와서 파라미터로 담기 -------------
		// 3-1단계. 세션에 저장된 ID를 가져와서 strId 변수에 담는다. 
		String strId = (String)request.getSession().getAttribute("sessionID");
		
		// [3-1] 회원 정보 수정은 수정된 정보를 DB에 넣어야하기 때문에 브라우저 input 데이터를 dto.set으로 데이터를 담는다. 		
		CustomerDTO dto = new CustomerDTO();
		
		dto.setUser_id(strId);     // 세션 아이디를 dto에 담는다.
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
		
		String address = address1 + ","  + address2  + "," + address3  + "," + address4;
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
		
		// -------------[4단계] 전역변수로 선언-------------
		// -------------[5단계] 회원정보 수정 처리------------- 
		int updateCnt = dao.updateCustomer(dto);
		System.out.println("updateCnt : " + updateCnt);
		
		// 6단계. jsp로 처리 결과 전달
		request.setAttribute("updateCnt", updateCnt);
	}
	
	@Override
	// 회원정보 인증 후 탈퇴처리
	public void deleteInfoAction(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// -------------[3단계] 화면에서 입력받은 값을 가져와서 파라미터로 담기 -------------
		// 3-1단계. 세션에 저장된 ID를 가져와서 strId 변수에 담는다. 
		String strId = (String)request.getSession().getAttribute("sessionID");
	
		// -------------[4단계] 전역변수로 선언-------------
		// -------------[5단계] 회원정보 삭제 처리------------- 
		int deleteCnt = dao.deleteCustomer(strId);
		
		// 6단계. jsp로 처리 결과 전달
		request.setAttribute("deleteCnt", deleteCnt);
	}
}
