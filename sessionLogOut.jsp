<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>sessionLogOut.jsp</h1>
<%
//로그인정보(세션값) 초기화
session.invalidate();
// response.sendRedirect("sessionLoginForm.jsp");
response.sendRedirect("sessionMain.jsp"); // 메인에 id == null 이면 로그인페이지로 이동하게 만들어져있음 !!
%>

</body>
</html>