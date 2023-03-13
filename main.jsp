<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>main.jsp</h1>
	
	<script type="text/javascript">
// 		function lg(){
// 			location.href = 'loginOut.jsp';
<%-- 			<% --%>
			
// 			//세션 초기화
// 			session.removeAttribute("id");
// 			session...						// 페이지이동으로 하는게 편하다고 ..
<%-- 			%> --%>
			
// 		}
	
	</script>
	
	
	<%
	String id = (String)session.getAttribute("id");
	if(id == null){										// .equals() 사용 안되던데 ,, 왜 ???
		response.sendRedirect("loginForm.jsp");
	}
	%>
	로그인 아이디 : <%=session.getAttribute("id") %>
	
	<br>
<!-- 로그아웃    -->
	<input type="button" value="Log Out" onclick="location.href='logOut.jsp'">
	
	<hr>
	
	<h3><a href="memberInfo.jsp"> 회원정보 조회</a></h3>
	<h3><a href="memberUpdate.jsp"> 회원정보 수정</a></h3>
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	

</body>
</html>