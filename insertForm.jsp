<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>insertForm.jsp</h1>
	<%
	/*
	앞으로 해야 할 기본 행동이면서 지식!
					DB
		C reate		> insert
		R ead		> select
		U pdate		> update
		D elete		> delete
	*/
	
	%>
	<fieldset>
		<form action="insertPro.jsp" method="post">
			아이디:<input type="text" name="id"><br>
			비밀번호:<input type="password" name="pw"><br>
			이메일:<input type="text" name="email"><br>
			
			<input type="submit" value="전송하기">
		</form>
	</fieldset>
	
	
	
	
</body>
</html>