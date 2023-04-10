<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>/el/attribute.jsp</h1>
<!-- 전달받은 속성정보 저장! -->

<%
// 업캐스팅 따로 안했는데 다운캐스팅 ?
int num1 = (Integer)request.getAttribute("test1");
%>

속성(JSP): <%=num1 %><br>
<!-- 스크립틀릿 엘리먼트 : 변수 -->
속성(EL) : ${num1 }  <br>
<!-- el 표현식 엘리먼트 : 속성(Attribute) -->

<h3>el 내장객체(영역): pageScope, requestScope, sessionScope, applicationScope</h3>
속성(EL) : ${requestScope.test1 }  <br>
속성(EL) : ${test1 }(영역객체명 생략)  <br>

<!-- 
영역객체명은 생략이 가능하다.
해당 경우, 영역객체를 순차적으로 접근한다.(p > r > s > a)
해당 객체를 찾을때 까지 진행하고, 만약 찾은경우
다른영역의 동일한 이름의 객체가 있어도 무시한다.
 -->
 <hr>
 test1(requestScope): ${requestScope.test1 }<br>
 test1(sessionScope): ${sessionScope.test1 }<br>
 test1(영역객체명 생략): ${test1 }<br>
 <!-- request 객체가 먼저 호출된다.
 		해당 문제를 회피하기 위해 같은 객체명을 사용하지 않는편이 좋다. -->
 
 
 <!-- 해보기 -->
<%-- ${requestScope } --%>


























</body>
</html>