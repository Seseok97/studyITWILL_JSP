<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>logOut.jsp</h1>
		
	<%
	//logout >> reset sessioninfo
	session.invalidate();
	%>
	
	<script type="text/javascript">
	alert('로그아웃 성공!');
	location.href='main.jsp';
	// session값이 없는 상황에서 main페이지로 넘어가면 loginForm페이지로 넘어가게 된다 !!
	</script>

</body>
</html>