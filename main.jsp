<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="color.jspf" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<%
// 	String myColor="green";
%>
<body bgcolor=<%=col1%>>
	<h1>main.jsp</h1>
	<h2>Template</h2>
	<table border="1" width="600" height="600">
	<tr>
		<td colspan="2" height="100">top - header: 로고이미지, 메뉴, 검색창 ...
		<jsp:include page="top.jsp"/></td>

	</tr>
	<tr>
		<td width="150">Left - subMenu: 보조메뉴, 검색결과 참고 ...
		<jsp:include page="left.jsp"/></td>
		<td>Main(right): 본문</td>
	</tr>
	<tr>
		<td colspan="2" height="100">Bottom - footer: 회사 정보 ... 
		<jsp:include page="bottom.jsp"/></td>
	</tr>
		
	</table>
</body>
</html>