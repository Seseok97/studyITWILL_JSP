<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- 
JSTL 사용시 필수!
접두사: c, 주소: http://java.sun.com/jsp/jstl/core 가져와서 태그 사용  -->
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>core_out.jsp</h1>

JSTL: <c:out value="ITWILL"/><br>
HTML: ITWILL<br>
JSP(표현식): <%="ITWILL" %><br>
<% out.print("JSP(스크립틀릿): ITWILL");%><br>
EL(표현식): ${"ITWILL" }<br>

<hr>
JSTL: <c:out value="100+200"/><br>
JSP(표현식): <%=100+200 %><br>
EL(표현식): ${100+200 }<br>
<br>
JSTL(JSP): <c:out value="<%=100+200 %>"/><br>
JSTL(EL): <c:out value="${100+200 }"/><br>
<!-- JSTL을 사용하여 화면에 출력하고, EL표현식을 활용하여 연산도 가능하다. -->

<hr>
<!-- EL표현식은 null값을 공백으로 출력한다!! -->
EL(표현식): ${itwill.id }<br> 
JSTL(EL): <c:out value="${itwill.id }" default="출력"/><br>
JSTL(EL): <c:out value="${100+200 }" default="출력"/><br>

<hr>
<abc>태그는 abc태그입니다.<br>
&lt;abc&gt;태그는 abc태그입니다.<br>
<c:out value="<abc>태그는 abc태그입니다."/><br>










</body>
</html>




























