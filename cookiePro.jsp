<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>cookiePro.jsp</h1>
	<%
		//쿠키 생성
		// > 어떤 정보를 쿠키에 담을 것인가?
		// >> 라디오 버튼에서 선택한 언어 정보
		Cookie cookie = new Cookie("lang",request.getParameter("language")); //lang이라는 이름의 쿠키에 language 정보를 저장
		
		//쿠키 사용 설정(유효기간)
		cookie.setMaxAge(3600); // 1h 동안 유지되는 쿠키를 설정
		
		//쿠키 전달(서버 > 클라)
		response.addCookie(cookie); // cookie라는 이름의 쿠키를 클라이언트에게 전달
		
	
	%>
		<script type="text/javascript">
		alert("쿠키정보 생성!");
		location.href="cookieForm.jsp";
		</script>
		

		
		
		
		
</body>
</html>