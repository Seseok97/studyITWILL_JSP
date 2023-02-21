<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>test2.jsp</h1>
	
	<h2>JSP - 내장객체(교재 p177~208)</h2>
	<hr>
	<h3>javax.servlet 패키지(8)</h3>
		-request	: 클라이언트의 HTTP 요청정보를 저장하는 객체						<br>
		-response	: HTTP 요청의 결과를 응답정보로 저장하는 객체						<br>
		-session	: 클라이언트의 세션정보를 저장하는 객체								<br>
		-application: 프로젝트의 정보를 저장하는 객체									<br>
		-pageContext: 페이지 실행에 필요한 프로젝트 정보를 저장하는 객체				<br>
		-out		: 응답페이지 전송을 위한 출력 스트림객체(그냥 출력하는 객체~)		<br>
		-config		: 해당 페이지의 서블릿 설정정보(초기화 정보)						<br>
		-page		: 해당 페이지 서블릿 객체											<br>
	
	<h3>java.lang 패키지(1)</h3>
		-exception	: 예외처리 객체														<br>
		
	<%
	//스크립틀릿
	// Request request = new Request();
	String str = new String("Hello");
	%>	
	<hr>
	<hr>
	<!-- request 객체 -->
	서버 도메인명 : <%=request.getServerName() %><br>
	URL : <%=request.getRequestURL() %><br>
	URI : <%=request.getRequestURI() %><br>
	전송방식 : <%=request.getMethod() %><br>
	물리적경로 : <%=request.getRealPath("/") %><br>
	http해더정보(user-agent):<%=request.getHeader("user-agent") %><br>
	
	<%
// 	response.setContentType("video/mp4");// 지정한 콘텐츠를 실행시켜줌
// 	response.sendRedirect("페이지주소"); // 지정한 페이지 주소로 이동시켜줌
// 	response.addHeader("Refresh","3");	 // 3초에 한번씩 새로고침
// 	response.addHeader("Refresh","5;url=http://www.itwillbs.co.kr"); // 5초 후에 지정한 페이지 주소로 이동시켜준다. >> 배민같은곳에서 사용한다 ~
	// 전부 뭔가 응답해주는거라서 ,, 주석처리 !!
	%>
	<hr>
	<!-- 	ms (1000분의 1초)로 표기됨 -->
	세션 생성시간: <%=session.getCreationTime() %><br>
	세션 최종접속시간: <%=session.getLastAccessedTime() %><br>
	<!-- 연산자를 활용하여 세선만료 기간을 지정할 수 있다. ex) 5분후 종료시키기 등 ,, -->
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
		
		
		
		
		

</body>
</html>