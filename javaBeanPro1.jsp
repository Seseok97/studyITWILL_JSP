<%@page import="com.itwillbs.javabean.JavaBean1"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>javaBeanPro1.jsp</h1>
	<%
	//한글처리
	request.setCharacterEncoding("UTF-8");
	//변수 받기
	String id = request.getParameter("id");
	%>
	
	아이디: <%=id %><br>
	
	<hr>
	
	<%
	// 자바빈 객체
	
	//객체 생성
	JavaBean1 jb = new JavaBean1(); // JavaBean1 입력후 ctrl+space 입력하면 자동으로 import된다!!
	//정보 저장
	jb.setId(id); // F3 입력하면 변수자리로 커서가 이동함. ctrl+MouseOver로도 가능!
	
	
	%>
	자바빈 객체: <%=jb %><br>
	자바빈 객체(.toString): <%=jb.toString() %><br>
	아이디(자바빈 객체): <%=jb.getId() %>
	
	<hr>
	자바빈(액션태그)
	
	<!-- 자바빈 객체 생성! -->
	<% // JavaBean1 jb = new JavaBean1(); %>
<%-- 	<jsp:useBean id="객체명" class="클래스위치(패키지 포함)"/> --%>
	<jsp:useBean id="jb2" class="com.itwillbs.javabean.JavaBean1"/>
	
	<!--  자바빈 객체 정보 저장 -->
	<%// jb.setId(id); %>
<%-- 	<jsp:setProperty property="변수명" name="객체명" value="값"/> --%>
	<jsp:setProperty property="id" name="jb2" value="admin"/>
	
	<!-- 자바빈 객체 정보 출력 -->
	<%// jb.getId(); %>
<%-- 	<jsp:getProperty property="변수명" name="객체명"/> --%>
	<jsp:getProperty property="id" name="jb2"/>
	
	<br>
		<!--  자바빈 객체 정보 저장 -->
	<%// jb.setId(request.getParameter("id")); %>
<%-- 	<jsp:setProperty property="변수명" name="객체명" value="값"/> --%>
<%-- 	<jsp:setProperty property="id" name="jb2" value="admin"/> --%>
<%-- 	param을 이용한 정보출력 > <jsp:setProperty property="id" name="jb2" param="id"/> --%>
	param을 이용한 정보출력 > <jsp:setProperty property="id" name="jb2"/>
	
	<!-- 자바빈 객체 정보 출력 -->
	<%// jb.getId(); %>
<%-- 	<jsp:getProperty property="변수명" name="객체명"/> --%>
	<jsp:getProperty property="id" name="jb2"/>
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
</body>
</html>