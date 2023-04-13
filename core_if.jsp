<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>core_if.jsp</h1>
<c:set var="i" value="itwill"/>
<!-- i변수값이 itwill일때, "아이티윌" 출력 -->
<!-- JSP의 경우 -->
<%
// JSTL 뒤에 별도로 영역을 지정하지 않을 경우, page로 자동 설정된다.
String i = (String)pageContext.getAttribute("i");
%>
i: <%=i %><br>
<%if(i.equals("itwill")){ %>
i: <%="아이티윌!" %><br>
<%} %>

<hr>
<!-- JSTL의 경우 -->
i: ${pageScope.i };
<%-- 
<c:if test="조건문">
 // 조건문이 참일때 실행
</c:if> 
--%>
<%-- 
	<c:if test="i == 'itwill'">
		<h3>아이티윌!</h3>
 	</c:if> 					>> 작동하지 않는다 !!--%>

<c:if test="${i == 'itwill' }">
	<h3>아이티윌!</h3>
</c:if>

<c:if test="${i.equals('itwill') }">
	<h3>아이티윌!</h3>
</c:if>


<hr>
<h2>홀짝구분하기</h2>
<c:set var="num" value="11"/>

<c:if test="${num%2 eq 1 }">
${num } >> 홀수입니다.
</c:if>
<c:if test="${num%2 != 1 }">
${num } >> 짝수입니다.
</c:if>

<br>

<!-- c:choose > if~else if || switch-case < 이쪽에 좀 더 가까움 -->
<c:choose>
	<c:when test="${num%2 eq 0 }">
		2의 배수!(choose)
 	 </c:when>
	<c:when test="${num%3 eq 0 }">
		3의 배수!(choose)
	 </c:when>
	<c:otherwise>
		<!-- 나머지들, else의 의미를 가진다. switch-case의 default와 유사한듯!! -->
		그외 나머지(choose-default)
	 </c:otherwise>
</c:choose>
<!-- JSP 코드를 최대한 줄이려고 JSTL을 사용하는 것!! > Spring 프레임워크에서는 JSP를 사용하지 않기 때문이다 !! -->
</body>
</html>
