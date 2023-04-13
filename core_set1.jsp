<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- prefix = 다른 글자로 바꿀 수 있지만, "core"의 의미를 담아'c'를 주로 사용한다. 안쓰면 왕따 -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>core_set1.jsp</h1>
JSTL(JSP Standard Tag Library): 자주 사용하는 기능을 모아놓은 커스텀 태그!

JSTL - core : 기본적인 동작(변수, 출력, 조건문, 반복문, ...) [p519~]
<hr>
	<%
	// 자바(JSP)코드 사용, 변수생성 > 연산결과 출력
	// > 해당페이지에서만 사용 가능한 "지역변수"이다!! >> 단점이 된다~
	int num1 = 100;
	int num2 = 200;
	int sum = num1+num2;
	%>
	결과: <%=sum %>
	
	<hr>
	<!-- JSTL의 변수선언 -->
	<!-- 영역객체에서의 속성(attribute)를 생성!! -->
<%--<c:set var="변수명" value="변수값" scope="기본page영역"/>--%>
	<c:set var="num3" value="300" scope="page"/>
	<c:set var="num4" value="400"/>
	<c:set var="sum2" value="${num3+num4}"/>
<%-- 	<c:out value="result: <%=sum2 %>"/> --%>	<!-- JSP코드 출력 -->
	<c:out value="result: ${sum2 }"/>				<!-- 영역객체 출력 -->
	<br>
	
	${num3 } + ${num4 } = ${num3+num4 }
	
	<hr>
<%-- 	${pageScope }<hr> --%>
<%-- 	${requestScope }<hr> --%>
<%-- 	${sessionScope }<hr> --%>
<%-- 	${applicationScope }<hr> --%>

	<hr>
	<h3>다른페이지에서도 사용 가능한 데이터 생성</h3>
	<c:set var="MODEL" value="S23" scope="session"/>
	<c:set var="NAME" value="삼성갤럭시" scope="session"/>
	<c:set var="PRICE" value="200" scope="session"/>
	
	<!-- core_set2.jsp 페이지에서 위 내용 출력 -->
	<!-- forward를 사용하여 이동! -->
	<jsp:forward page="core_set2.jsp"/>
	

</body>
</html>
