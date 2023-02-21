<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>test.jsp</h1>
<!-- 멤버변수 선언 -->
<%! int a = 100; %>
<!-- 지역변수 선언 -->
<% int b = 200; %> <!-- 코드를 메모장으로 보면 두 변수의 선언 위치 차이가 보인다. -->
<!-- 화면에 출력 -->
<%=a %> <br>
<%=b %> <br>



</body>
</html>