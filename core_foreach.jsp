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
<h1>core_foreach.jsp</h1>
<%
// for(:){} // > 이걸 foreach라고 부름!
String[] strArr = {"a","b","c","d","e"};
// String str; // 콜론 앞에 박아야된다
for(String str:strArr){
	System.out.println(str);
}
%>
<c:forEach begin="1" end="5" step="1">
	forEachTest<br>
</c:forEach>

<c:forEach var="i" begin="1" end="5" step="1">
	forEachTest > ${i } <br>
</c:forEach>

<hr>
<!-- c:forEach로 배열값 출력하기. -->
<c:forEach var="s" items="<%=strArr %>"> <!-- strArr의 길이만큼 반복된다. -->
	반복: ${s }<br>
</c:forEach>

<c:forEach var="s" items="${strArr }"> <!-- 이거로 출력하고싶으면 영역객체에 "strArr"이름의 배열을 저장해야한다. -->
	반복: ${s }<br>
</c:forEach>
<%pageContext.setAttribute("strArr", strArr); %> <!-- page 영역객체에 strArr 저장. -->
<c:forEach var="s" items="${strArr }">
	반복(EL): ${s }<br>
</c:forEach>



</body>
</html>










































