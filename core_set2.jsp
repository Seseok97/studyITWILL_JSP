<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>core_set2.jsp</h1>

모델명: ${requestScope.MODEL }<br>
이름: ${NAME } <br>
가격: ${PRICE }<br>

<h3>영역객체의 데이터 삭제</h3>
<c:remove var="NAME" scope="session"/>
모델명: ${requestScope.MODEL }<br>
이름: ${NAME } <br>
가격: ${PRICE }<br>

<hr>
<hr>
<h3>서블릿에서 전달된 정보 출력</h3>
이름: ${requestScope.person.name }<br>
<c:set var="name" value="${requestScope.person.name }"/>
이름: <c:out value="${name }"/><br>
이름: ${name }<br> <!-- 이 방식이 제일 편하고 많이 쓰일것임!! -->

<h4>ArrayList</h4>
${requestScope.memberList }<br>
1번 사용자 이름: ${memberList[0].name }<br>
2번 사용자 이름: ${memberList[1].name }<br>

<br>

<c:set var="p" value="${memberList[0] }"/>
<c:set var="p1" value="${memberList[1] }"/>
1번 사용자 이름(JSTL): ${p.name }<br>
2번 사용자 이름(JSTL): ${p1.name }<br>
</body>
</html>


































