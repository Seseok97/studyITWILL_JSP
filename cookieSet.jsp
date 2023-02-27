<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>cookieSet.jsp</h1>
<h2>서버</h2>

<%
//쿠키값 생성 >> 쿠폰 생성만 한것. 클리이언트의 메모리나 HDD에는 저장 X
Cookie cookie = new Cookie("name","ITWILL");

//유효기간 설정
cookie.setMaxAge(600); // 초단위 > 600 = 10분동안 존재하는 쿠키 생성. 
	// 유효기간일 뿐, 시간이 지났다고 삭제되지 않는다. > 보안 취약점

//쿠키정보를 저장 + 전달
response.addCookie(cookie); // 쿠폰을 전달한것
%>
<script type="text/javascript">
alert("쿠키값 생성!");
location.href="cookieTest.jsp";

</script>

</body>
</html>