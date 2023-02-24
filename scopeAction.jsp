<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>scopeAction.jsp</h1>

			<%String id = request.getParameter("id"); %>
<%-- 			<%String id = session.getParameter("id"); %> //안됨 --%>

			<%String pw = request.getParameter("pw"); %>
			
			User ID: <%=id %><hr>
			User PW: <%=pw %><hr>
			
			pageContext 내장객체 값 : <%=pageContext.getAttribute("p") %>	<br>
			request 내장객체 값 : <%=request.getAttribute("r") %>		<br>
			session 내장객체 값 : <%=session.getAttribute("s") %>		<br>
			application 내장객체 값 : <%=application.getAttribute("a") %>	<br>
			

			
</body>
</html>