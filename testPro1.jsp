<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>testPro1.jsp</h1>
			<%
			//폼태그에서 전송된(submit) 데이터 >> 파라미터
			// 파라미터 데이터는 항상 String 타입이다. 이유 없음 ~ 그냥 정해진거 !!
			String number = request.getParameter("number");
			//input태그의 name 정보를 사용해서 파라미터의 값을 가져온다.
			// out.print(number);
			%>
			
			전달된 숫자: <%=number %><br>
			전달된 숫자 + 100:<%=number+100 %><br>
			전달된 숫자: <%=request.getParameter("number") %><br>
			전달된 숫자 + 100:<%=Integer.parseInt(number) +100 %><br>
			
			<% 
			String name = request.getParameter("name");
			%>
			
			전달된 이름: <%=name %>;


</body>
</html>