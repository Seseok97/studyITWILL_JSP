<%@page import="com.itwillbs.javabean.JavaBean2"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>javaBeanPro2.jsp</h1>
	<%
	//한글처리
	request.setCharacterEncoding("UTF-8");
	
	//1. JSP코드(자바)로 정보 전달받아 출력
	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
	String email = request.getParameter("email");
	
	//2. JSP코드(자바빈)로 정보 전달받아 출력
	JavaBean2 jb2 = new JavaBean2();
	jb2.setId(request.getParameter("id"));
	jb2.setPw(request.getParameter("pw"));
	jb2.setEmail(request.getParameter("email"));
	// 별도 파일에서 진행한다고 생각하면 이렇게 쓰는것도 가능하다.
	%>
	
<!-- 3. ActionTag(자바빈)로 정보 전달받아 출력 -->
	<jsp:useBean id="jbAT" class="com.itwillbs.javabean.JavaBean2"/>
<%-- 	<jsp:setProperty property="id" name="jbAT"/> --%>
<%-- 	<jsp:setProperty property="pw" name="jbAT"/> --%>
<%-- 	<jsp:setProperty property="email" name="jbAT"/> --%>
	<jsp:setProperty property="*" name="jbAT"/>
	
	
	1.JSP코드<br>
	아이디: <%=id %><br>
	비밀번호: <%=pw %><br>
	이메일: <%=email %>
	<hr>
	2.JSP코드(자바빈)<br>
	아이디: <%=jb2.getId() %><br>
	비밀번호: <%=jb2.getPw() %><br>
	이메일: <%=jb2.getEmail() %>
	<hr>
	3.JSP코드(액션태그)<br>
	아이디: <jsp:getProperty property="id" name="jbAT"/><br>
	비밀번호: <jsp:getProperty property="pw" name="jbAT"/><br>
	이메일: <jsp:getProperty property="email" name="jbAT"/><br>
	
	
	

</body>
</html>