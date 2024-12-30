package mvc.jsp.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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
		// [2단계] 클라이언트 요청을 분석

		// 한글 안깨지게 처리
		request.setCharacterEncoding("UTF-8");

		// getRequestURI : 호출된 FULL 주소를 가져 온다.
		// -> http://localhost/jsp_pj_ict04/*.do (url 매핑을 *.do로 만들어서)
		String uri = request.getRequestURI(); // uri : ==> /jsp_pj_ict04/*.do

		// contextPath(프로젝트 명을 가지고 오는 메서드, jsp_pj_ict04와 동일)
		String contextPath = request.getContextPath();

		// uri.substring(시작위치, 끝); : contextPath의 문자열 시작부터 끝까지 추출
		// -> 전체 경로에서 .do 파일명만 url 변수에 담는다
		String url = uri.substring(contextPath.length());
		String viewPage = ""; // 이동할 페이지를 담는 변수

		// 홈페이지 (main.do)
		// 컨트롤러를 구동하면, main.jsp가 응답함.
		if (url.equals("/main.do") || url.equals("/*.do")) {
			System.out.println("<<<url => /main.do >>>");

			viewPage = "common/main.jsp";
		}

		// RequestDispatcher
		// : 서블릿 또는 JSP 요청을 받은 후, 다른 컴포넌트로 요청을 위임하는 클래스이다.
		// forward == sendRedirect와 동일 기능 메서드, 페이지 이동 메서드
		RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
		dispatcher.forward(request, response);
	}

}
