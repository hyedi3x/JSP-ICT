## 🤖 Movie-JSP
- only JSP 방식으로 페이지를 연동하고, 오라클 디비를 연동하여 데이터를 조회하고 로그인한다. 
- 로그인과 극장 조회만 가능하다. (극장 조회도, 현재 디비에 3개 정도만 지정 - CGV강남, CGV강변, CGV건대입구)
- 다른 기능은 서블릿과 함께 추가적으로 만들 예정 
<img src="../movie_jsp_jdbc/imgs/Movie-JSP.gif " alt="시연 영상">
<br><br>

### ⚙️사용한 주요 JSP 방법
> 🔩 **<jsp:include page="jsp파일명" /> 액션태그**
>  - 동적 include 방식
>  - include되는 jsp파일의 출력결과(Html 코드)만 포함
>  - include되는 jsp파일의 변수 사용 불가
>  - jsp:param 태그로 값 전송 가능
``` jsp
<jsp:include page="cinema.jsp" />
```
<br>

> 🔩 **<%@ include file="jsp파일명" /> 스크립트 태그**
>  - 정적 include 방식
>  - include하는 jsp 파일내에 복사되어 같이 컴파일됨
>  - include되는 jsp파일 내 전역변수를 상위 jsp에서 사용가능
``` jsp
<%@ include file="header.jsp" %>
```
<br>

> 🔩 **[jsp:param 액션 태그]**
>  - jsp:include나 jsp:forward를 사용할 때 다른 페이지에 값을 전달해주는 액션 태그
>  - 전달할 수 있는 값은 String 뿐
>  - 다른 타입의 객체를 전달할 때는 내장 객체의 영역을 이용
``` jsp
<jsp:include page="seoulImpI.jsp" flush="false">
	<jsp:param name="cinema_area" value="<%= seoulArea %>"/>
</jsp:include>
```