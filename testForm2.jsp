<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1> testForm2.jsp</h1>
<!-- 사용자로부터 이름, 나이정보를 입력 -->
<!-- testPro2.jsp로 정보를 전달하고, 사용자가 성인/미성년인지 판단하라. -->

	<fieldset>
		<form action="testPro2.jsp" name="fr" method="post"> <!-- 나중에 .. 빈칸으로 서브밋 하면 진행되지않게 하기 ! -->
			이름: <br><input type="text" name="name">	<br>
			나이: <br><input type="text" name="age">	<br>
			<input type="submit" value="전송">		<br>

		</form>
	</fieldset>



</body>
</html>