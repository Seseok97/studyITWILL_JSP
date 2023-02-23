<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>testForm3.jsp</h1>
	<fieldset>
		<form action="testPro3.jsp" method="post">
			이름: <input type="text" name="name"><hr>
			하고<br>싶은말: <textarea rows="3" cols="15" 
						name="msg"></textarea><hr>
			성별: 남<input type="radio" name="gender" value="남">
				  여<input type="radio" name="gender" value="여"><hr>
			취미: 
					축구<input type="checkbox" name="hobby" value="축구">
				    야구<input type="checkbox" name="hobby" value="야구">
				    요리<input type="checkbox" name="hobby" value="요리"> <hr>
			강의실: 
				<select name="classNo">
					<option value="0">강의장을 선택하세요.</option>
					<option value="1">1강의실</option>
					<option value="2">2강의실</option>
					<option value="3">3강의실</option>
					<option value="4">4강의실</option>
				</select><hr>
				
				<input type="submit" value="전송">
				  
		</form>
	</fieldset>

</body>
</html>