package mvc.jsp.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mvc.jsp.service.CustomerSerivceImpl;

// url mapping을 *.do로 받는다. (do로 모두 받음), "/" 사용 x
// servlet : 요청에 대한 권한 관리 클래스
@WebServlet("*.do")
public class CustomerController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	// 디폴트 생성자
	public CustomerController() {
		super();
	}

	// -------------------- [1단계] 웹브라우저가 전송한 HTTP 전송을 받음 --------------------
	// get으로 전송한 데이터를 받는 공간
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		action(request, response); // action 메서드 데이터를 불러옴.
	}

	// post로 전송한 데이터를 받는 공간
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response); // post로 받은 데이터를 doGet으로 전송
	}

	// doGet 메서드에서 action 함수를 사용하기 위해 생성
	// Service와 Controller 간의 데이터 유통
	public void action(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// -------------------- [2단계] 클라이언트 요청을 분석 --------------------

		// 한글 안깨지게 처리
		request.setCharacterEncoding("UTF-8");

		// ********************** [getRequestURI] **********************
		// : 프로젝트명 + 파일주소를 가져 온다.
		String uri = request.getRequestURI(); // ==> /mvc_jsp_movie/*.do (url 매핑을 *.do로 만들어서)

		// ********************** [getContextPath] **********************
		// : 프로젝트 명을 가지고 오는 메서드 (mvc_jsp_movie와 동일)
		String contextPath = request.getContextPath();

		// uri.substring(시작위치, 끝); : contextPath의 문자열 시작부터 끝까지 추출
		// -> 전체 경로에서 .do 파일명만 url 변수에 담는다
		String url = uri.substring(contextPath.length());
		String viewPage = ""; // 이동할 페이지를 담는 변수

		// ======================= 홈페이지 (main.do) =======================
		// 컨트롤러를 구동하면,*.do가 응답함. (viewPage를 common/main.jsp로 설정, 해당 페이지로 이동)
		if (url.equals("/main.do") || url.equals("/*.do")) {
			System.out.println("<<controller - main.do>>");

			viewPage = "common/main.jsp";
		}

		// ======================= [회원가입 페이지] =======================
		else if (url.equals("/join.do")) {
			System.out.println("<<controller - join.do >>");

			viewPage = "customer/join/join.jsp";
		}

		// ======================= [id 중복 확인 처리 페이지] =======================
		else if (url.equals("/idConfirm.do")) {
			System.out.println("<<controller - idConfirm.do >>");
			
			CustomerSerivceImpl service = new CustomerSerivceImpl();
			service.idConfirmAction(request, response);
			
			viewPage = "customer/join/idConfirm.jsp";
		}
		
		// ======================= [회원가입 처리 페이지] =======================
		else if(url.equals("/joinAction.do")) {
			System.out.println("<<<url => /joinAction.do >>>");
			
			CustomerSerivceImpl service = new CustomerSerivceImpl();
			service.signUpAction(request, response);
			
			viewPage = "customer/join/joinAction.jsp";			
		}
		
		// ======================= [로그인 페이지] =======================
		else if(url.equals("/login.do")) {
			System.out.println("<<<url => /login.do >>>");
			
			viewPage = "customer/login/login.jsp";			
		}
		
		// ======================= [로그인 처리 페이지] =======================
		else if(url.equals("/loginAction.do")) {
			System.out.println("<<<url => /loginAction.do >>>");
			CustomerSerivceImpl service = new CustomerSerivceImpl();
			service.loginAction(request, response);
			
			viewPage = "customer/login/loginAction.jsp";		
		}
		
		else if (url.equals("/adminMain.do")) {
			System.out.println("<<controller - adminMain.do>>");

			viewPage = "admin/main.jsp";
		}
		
		else if (url.equals("/loginMain.do")) {
			System.out.println("<<controller - loginMain.do>>");

			viewPage = "login/main.jsp";
		}
		
		
		
		// ======================= [로그아웃 페이지] =======================
		else if(url.equals("/logout.do")) {
			System.out.println("<<<url => /logout.do >>>");
			
			// 세션 삭제
			request.getSession().invalidate();
			viewPage = "common/main.jsp";			
		}

		// ********************** [RequestDispatcher] **********************
		// : 서블릿 또는 JSP 요청을 받은 후, 다른 컴포넌트로 요청을 위임하는 클래스이다.
		// 현재, request에 담긴 정보를 저장하고 있다가, 다른 페이지에서도 해당 정보를 볼 수 있게 계속 저장하는 기능 (파라미터 정보를
		// 유지)

		// forward 페이지 이동 메서드 (파라미터의 정보를 저장하고, 다른 페이지에도 넘겨주는 메서드)
		RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
		dispatcher.forward(request, response);

		// sendRedirect 페이지 이동 메서드(모든 파라미터의 정보를 제외하고, 단순하게 페이지를 호출하는 메서드)
	}

}
