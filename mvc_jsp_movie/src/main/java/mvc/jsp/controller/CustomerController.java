package mvc.jsp.controller;

import java.io.IOException;

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

	}
}
