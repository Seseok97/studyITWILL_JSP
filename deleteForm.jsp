<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>deleteForm.jsp</h1>

	<fieldset>
		<legend>회원탈퇴시 비밀번호를 입력하세요!</legend>
		<form action="deletePro.jsp" method="post">
			<input type="hidden" name="id" value="admin"><br>
			Password: <input type="password" name="pw" placeholder="비밀번호를 입력하세요.">
			<input type="submit" value="탈퇴">
		</form>
	</fieldset>



</body>
</html>