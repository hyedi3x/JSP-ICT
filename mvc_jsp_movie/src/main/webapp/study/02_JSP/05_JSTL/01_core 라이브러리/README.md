## 🧐 JSTL - core 라이브러리
> `core 라이브러리`는 ***'변수 처리'***, ***'흐름 제어'***, ***'URL 관리'***, ***'출력'*** 등 가장 ***"기본적인 기능을 구현한 라이브러리"*** 이다. 
```jsp
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
```
<br>
<hr>

>  참고 : https://velog.io/@gabriela/JSP-JSTL

### 💡 c:set (변수 선언)
> - **'속성(Attribute)을 저장'** 할 때 사용한다.
> - binding 영역을 지정할 수 있다. (디폴트는 pageContext에 저장임)
> - **scop속성을 생략하면**, 디폴트는 `page`
> - ***c:set에 저장된 값은 EL로 출력할 수 있다.*** ⭐
```jsp
    <c:set var="참조 변수(객체)" value="값" scope="binding영역" />

    <!-- pageContext.setAttribute("age", 3) -->
    <c:set var="age" value="3"/>  
    <c:set var="isAdult" value="${age >= 20}"/>

    <!-- 앞으로 자주 사용할 c:set -->
    <c:set var="contextPath" value="${pageContext.request.contextPath}"/>
```

|영역|작성방법|
|---|---|
| `pageScope` | page |
| `requestScope` | request |
| `sessionScope` | session |
| `applicationScope` |application  |

<br>

### 💡 c:out (출력 태그)
>- **'출력을 위한 태그'** 이다. 
```jsp
    <c:out value="${age}" default="Not registered" escapeXml="true" />
```

|속성|설명|
|---|---|
| `value` | **'c:set'에서 지정한 [var 값]** |
| `default` | **'출력하고자 하는 객체가 없을 때' [출력할 값]을 의미**한다. (img 태그의 alt 속성과 유사) |
| `excapeXml` | true인 경우, **'태그'를 [일반 문자열로 처리]** 한다. (기본값 : false) |

<br>

### 💡 c:forEach (출력 태그)
>- **'<c:forEach> - 자바의 for-in 구조와 유사한 형태(반복문)'** 이다. 
>- `${varStatus별칭.index}` : **'0'부터 반복**한다. 
>- `${varStatus별칭.count}` : **'1'부터 반복**한다. 
```jsp
    <!-- 일반 for문 형식 -->
    <c:forEach var="속성" begin="시작값" end="종료값" step="증가값">
	    ${속성}
    </c:forEach>

    <!-- 향상 for문 형식 -->
    <c:forEach var="요소" items="배열 or 리스트" varStatus="인덱스명">
	    ${요소}
    </c:forEach>

    <!-- <c:forEach> 태그와 배열 -->
    <%
        String[] seasons = {"봄", "여름", "가을", "겨울"};
        pageContext.setAttribute("seasons", seasons);
    %>
    <c:forEach var="season" items="${seasons}" varStatus="vs">
        <div>인덱스 : ${vs.index}</div>
        <div>요소   : ${season}</div>
    </c:forEach>

    <!-- <c:forEach> 태그와 리스트 -->
    <%
        List<String> jobs = Arrays.asList("PM", "기획자", "개발자", "퍼블리셔");
        pageContext.setAttribute("jobs", jobs);
    %>
    <c:forEach var="job" items="${jobs}" varStatus="vs">
        <div>인덱스 : ${vs.index}</div>
        <div>직업   : ${job}</div>
    </c:forEach>
</c:forEach>
```

<br>

### 💡 c:if (조건문)
>- **'조건식'** 이다. (else문이 없다.)
```jsp
<!--var 값의 value가 80일 때, -->
<c:set var="score" value="80"/>
  <c:if test="${score >= 90 and score <= 100}"><c:set var="grade" value="A"/></c:if>
  <c:if test="${score >= 80 and score < 90}"><c:set var="grade" value="B"/></c:if>
  <c:if test="${score >= 70 and score < 80}"><c:set var="grade" value="C"/></c:if>
  <c:if test="${score >= 60 and score < 70}"><c:set var="grade" value="D"/></c:if>
  <c:if test="${score >= 0  and score < 60}"><c:set var="grade" value="F"/></c:if>
  <div>${score}점, ${grade}학점</div>
```

<br>

### 💡 c:choose • c:when • c:otherwise (조건문)
>- **'switch case 구문과 유사한 조건식'** 이다. (c:if보다 정교한 처리가 가능하지만, 복잡한 조건 구성은 권장하지 않는다.)
```jsp
<!-- c:choose 형식 -->
<c:choose>
	<c:when test="조건식">
		실행문
	</c:when>
	<c:when test="조건식">
		실행문
	</c:when>
	<c:otherwise>
		실행문
	</c:otherwise>
</c:choose>

<!--var 값의 value가 15일 때, -->
<c:set var="age" value="15"/>
  <c:choose>
    <c:when test="${age < 14}">
      <c:set var="result" value="초등학생"/>
    </c:when>
    <c:when test="${age < 17}">
      <c:set var="result" value="중학생"/>
    </c:when>
    <c:when test="${age < 20}">
      <c:set var="result" value="고등학생"/>
    </c:when>
    <c:otherwise>
      <c:set var="result" value="성인"/>
    </c:otherwise>
  </c:choose>
  <div>${age}살, ${result}</div>
```

<br>

### 💡 c:forTokens (조건문)
>- 자바의 StringTokenizer와 유사하게 **구분자로 '문자열을 나누는 (토큰 분리)' 태그**이다. 
```jsp
<!-- c:forTokens 형식 -->
<c:forTokens var="token" items="문자열" delims="구분자">
	${token}
</c:forTokens>

<!-- 구분자(|)를 기준으로, 문자열을 나눈다. -->
<c:forTokens var="city" items="seoul | tokyo | new york" delims="|">
    ${city}
</c:forTokens>
```
