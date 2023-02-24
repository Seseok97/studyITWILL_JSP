<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>sessionSet.jsp</h1>
	<h2>서버 (카페)</h2>
	
	<%
		System.out.println("정보 요청!");
		System.out.println("아아 한잔이요!");
		
		System.out.println("포인트 적립!");
		//세션에 정보를 저장
		session.setAttribute("point", "100");

	%>
	
	<script type="text/javascript">
		alert("작업 완료 ! (커피완료, 세션값 생성!)")
		location.href="sessionTest.jsp";
	</script>
	
	
	
</body>
</html>