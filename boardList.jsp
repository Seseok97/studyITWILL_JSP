<%@page import="com.itwillbs.board.BoardDTO"%>
<%@page import="java.util.ArrayList"%>
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
	<h1>boardList.jsp</h1>
	<h2><a href="writeForm.jsp">글쓰기</a></h2>
	
	<%
		//writePro => boardList!! 전달받은 정보는 없다.
		
		//게시판 정보(DB) 출력
		
		// BoardDAO 생성
		BoardDAO dao = new BoardDAO();
		// DB에서 게시판글 정보를 전부 가져오기
		ArrayList boardList = 
				dao.getBoardListAll();
	%>
<%-- 	<%=boardList %> --%>
	
	<table border="1">
		<tr>
			<td>글 번호</td>
			<td>제목</td>
			<td>작성자</td>
			<td>작성일</td>
			<td>조회수</td>
			<td>IP</td>
		</tr>
		<%for(int i=0;i<boardList.size();i++){
			//ArrayList > DTO > 변수정보 가져오기
// 		BoardDTO dto = boardList.get(i); // 타입미스매치 에러
		BoardDTO dto = (BoardDTO)boardList.get(i); // 다운캐스팅
		%>
		<tr>
			<td><%=dto.getBno() %></td>
			<td><%=dto.getSubject() %></td>
			<td><%=dto.getName() %></td>
			<td><%=dto.getDate() %></td>
			<td><%=dto.getReadcount() %></td>
			<td><%=dto.getIp() %></td>
		</tr>
		<%} %>
	</table>

</body>
</html>