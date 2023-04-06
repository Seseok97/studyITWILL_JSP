<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	form{
		margin: auto;
		border: 2px solid black;
		width: 250px;
	}
	
</style>

</head>
<body>
	<h1>fileUploadForm.jsp</h1>
	
	<form action="fileUploadPro.jsp" method="post" enctype="multipart/form-data">
		작성자: <input type="text" name="name"><br>
		<input type="file" name="file"><br>
		
		<input type="submit" value="Upload">
	</form>
	
	
	
	
	
	
	
	
	
	
	
	
	

</body>
</html>


































































