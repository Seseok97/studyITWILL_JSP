<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>sessionTest.jsp</h1>
	<!-- HTTP 프로토콜을 통하여 통신할 때는 상태가 유지되지 않는다 !!(p.271)
	> 응답을 요청한 클라이언트와 응답한 서버가 1회 통신하면, 해당 정보는 사라지게 된다. >> 데이터가 많아서 ..
	
	이 문제를 보완하기 위한 것이 세션과 쿠키 ! (p.272)
	세션 : 클라이언트의 정보를 서버와 클라이언트 저장소에 저장하는 것.
	쿠키 : 클라이언트의 정보를 클라이언트 저장소에 저장하는 것. -->
	
	<h2>클라이언트 (손님)</h2>
	
	<%
		//세션의 정보를 가져오기
		String point = (String)session.getAttribute("point");
		if(point == null){
			System.out.println("서버 안다녀옴, 커피 산 적 없음 !");
		}else{
			System.out.println("서버 다녀옴, 커피 산 적 있음 !!");
		}
	
	%>
	
	<input type="button" value="세션값 생성" 
	onclick="location.href='sessionSet.jsp';">
	

	
	
	
	
	
	
</body>
</html>