package mvc.jsp.dto;

import java.sql.Date;
import java.sql.Timestamp;

// [데이터베이스 레코드의 데이터를 매핑하기 위한 데이터 클래스]
// : 데이터 접근을 위한 getter와 setter를 가지고 있음
public class CustomerDTO {

	// 멤버 변수 (input이나 value 입력을 입출력)
	private String user_id; // 아이디
	private String user_pwd; // 비번
	private String user_name; // 이름
	private Date user_birth; // 생일
	private String user_phone; // 핸드폰 번호
	private String user_address; // 주소
	private String user_email; // 이메일
	private String user_tel; // 전화번호
	private Timestamp user_regDate; // 가입일

	// 디폴트 생성자
	public CustomerDTO() {
		super();
	}

	// 매개변수 생성자
	public CustomerDTO(String user_id, String user_pwd, String user_name, Date user_birth, String user_phone,
			String user_address, String user_email, String user_tel) {
		super();
		this.user_id = user_id;
		this.user_pwd = user_pwd;
		this.user_name = user_name;
		this.user_birth = user_birth;
		this.user_phone = user_phone;
		this.user_address = user_address;
		this.user_email = user_email;
		this.user_tel = user_tel;
		this.user_regDate = user_regDate;
	}

	// Get, Set 메서드
	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	public String getUser_pwd() {
		return user_pwd;
	}

	public void setUser_pwd(String user_pwd) {
		this.user_pwd = user_pwd;
	}

	public String getUser_name() {
		return user_name;
	}

	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}

	public Date getUser_birth() {
		return user_birth;
	}

	public void setUser_birth(Date user_birth) {
		this.user_birth = user_birth;
	}

	public String getUser_phone() {
		return user_phone;
	}

	public void setUser_phone(String user_phone) {
		this.user_phone = user_phone;
	}

	public String getUser_address() {
		return user_address;
	}

	public void setUser_address(String user_address) {
		this.user_address = user_address;
	}

	public String getUser_email() {
		return user_email;
	}

	public void setUser_email(String user_email) {
		this.user_email = user_email;
	}

	public String getUser_tel() {
		return user_tel;
	}

	public void setUser_tel(String user_tel) {
		this.user_tel = user_tel;
	}

	public Timestamp getUser_regDate() {
		return user_regDate;
	}

	public void setUser_regDate(Timestamp user_regDate) {
		this.user_regDate = user_regDate;
	}

	// 모든 변수를 toString으로 담는다.
	// toString() 메서드: 객체가 가지고 있는 정보나 값들을 문자열로 만들어 리턴하는 메소드
	@Override
	public String toString() {
		return "CustomerDTO [user_id=" + user_id + ", user_pwd=" + user_pwd + ", user_name=" + user_name
				+ ", user_birth=" + user_birth + ", user_phone=" + user_phone + ", user_address=" + user_address
				+ ", user_email=" + user_email + ", user_tel=" + user_tel + ", user_regDate=" + user_regDate + "]";
	}
}

/*
 * CREATE TABLE movie_customer_tb( user_id VARCHAR2(20) PRIMARY KEY, -- ID
 * user_pwd VARCHAR2(20) NOT NULL, -- 비밀번호 user_name VARCHAR2(30) NOT NULL, --이름
 * user_birth DATE NOT NULL, -- 생년월일 user_phone VARCHAR2(13) NOT NULL, -- 핸드폰
 * user_address VARCHAR2(70) NOT NULL, -- 주소 user_email VARCHAR2(30), -- 이메일
 * user_tel VARCHAR2(13), -- 지역 전화번호 user_no VARCHAR2(20), -- 유저 고유 번호
 * user_regDate TIMESTAMP DEFAULT sysdate, -- 가입일 login_session VARCHAR2(1)
 * DEFAULT 'C' -- 로그인 권한 (어드민과 구분) );
 */
