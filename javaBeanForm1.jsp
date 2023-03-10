<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>javaBeanForm.jsp</h1>
	<%
		/*
		@ 자바 빈(JAVA BEAN)이란?
				>> 특정한 기능을 하는 객체의 한 종류. 일반적인 객체가 될 수도 있으나,
				   특히 자바빈 설계규칙이 적용된 객체를 말한다.
		
		
		@ 자바빈(JAVA BEAN) 설계 규약
			1) 특정 패키지를 사용해야 한다.(defalut package X)
			2) 기본 생성자가 있어야 한다.
			3) 멤버변수의 접근제어자는 private로 설정 되어있어야 한다.
			4) get/set 메서드를 선언해야 한다(public 접근제한자 사용)
		*/
	%>
	<fieldset>
		<form action="javaBeanPro1.jsp" method="post">
			<input type="text" name="id">
			<input type="submit" value="send">
		</form>
	</fieldset>
</body>
</html>