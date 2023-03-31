<%@page import="com.itwillbs.board.BoardDTO"%>
<%@page import="com.itwillbs.board.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>boardDelete.jsp</h1>
	<h1>글 정보 삭제하기</h1>
	<%
	int bno = Integer.parseInt(request.getParameter("bno"));
	String pageNum = request.getParameter("pageNum");
	
	BoardDAO dao = new BoardDAO();
	BoardDTO dto = dao.getBoard(bno);
	System.out.println("bno를 통하여 글 정보 가져오기 성공!");
	
	%>

	<form action="boardDeletePro.jsp?pageNum=<%=pageNum %>" method="post">
		<input type="hidden" name="bno" value="<%=bno %>">
		비밀번호: <input type="password" name="pass">
		<input type="submit" value="글 삭제">
	</form>















































</body>
</html>