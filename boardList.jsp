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
	<h2><a href="fWriteForm.jsp">파일 글쓰기</a></h2>
	
	<%
		//writePro => boardList!! 전달받은 정보는 없다.
		
	//게시판 정보(DB) 출력
		
		// BoardDAO 생성
		BoardDAO dao = new BoardDAO();
		
	//페이징 처리 1
		// 	전체 글의 개수
		int count = dao.getBoardCount();
		
		// 	한 페이지에 출력할 글의 개수
		int pageSize = 10;
		
		// 현재 페이지 정보 (몇 페이지에 머물러있는지 체크)
		String pageNum = request.getParameter("pageNum");
		if(pageNum == null){
			pageNum = "1"; // 기본페이지는 1페이지로 고정하겠다.
		}
		
		// 시작행 번호 계산// 1 > 11 > 21 > 31 ...
		int currentPage = Integer.parseInt(pageNum);
		int startRow = (currentPage - 1) * pageSize + 1;
		// 끝행 번호 계산 // 10 > 20 > 30 > 40 ...
		int endRow = currentPage * pageSize;
		
		
		//DB에서 게시판글 정보를 전부 가져오기
// 		ArrayList boardList = dao.getBoardListAll();

		// DB에서 게시판글 일부만 가져오기(페이징 처리).
		ArrayList boardList = dao.getBoardList(startRow,pageSize);
	
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
			<td>
				<%if(dto.getRe_lev() > 0){ %>
					<img src="level.gif" width="<%=dto.getRe_lev() > 1? 10*dto.getRe_lev():0 %>">
					<img src="re.gif">
				<%} %>
				<a href="boardContent.jsp?bno=<%=dto.getBno()%>&pageNum=<%=pageNum %>"><%=dto.getSubject() %></a>
				<%if(dto.getFile() != null) {%>
			<img src="save.png" width="13" height="13">
			<% } %></td>
			<td><%=dto.getName() %></td>
			<td><%=dto.getDate() %></td>
			<td><%=dto.getReadcount() %></td>
			<td><%=dto.getIp() %></td>
		</tr>
		<%} %>
		<hr>
		<%
		//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		// 페이징처리 2
		if(count != 0){
			// 전체 페이지 수 계산
			
			// 전체: 50개, 페이지당 10개씩 출력 >> 5페이지
			// 전체: 56개, 페이지당 10개씩 출력 >> 6페이지
			
			int pageCount = count/pageSize + (count%pageSize==0? 0:1);
			
			// 한 화면에 보여줄 페이지 번호의 개수
			int pageBlock = 6;
			
			// 시작페이지 번호 1~10 > 1 // 11~20 > 11 ...
			int startPage = (((currentPage -1)/pageBlock)*pageBlock)+1;
			// 끝페이지 번호 1~10 > 10, 11~20 > 20 ...
			int endPage = startPage+pageBlock-1;
			if(endPage>pageCount){
				endPage = pageCount;
			}
		
		//[이전]
			if(startPage > pageBlock){
				%>
					<a href="boardList.jsp?pageNum=<%=startPage-pageBlock %>">[Last]</a>
				<%
			} // if end
		
		//1,2,3,...10
			for(int i=startPage;i<=endPage;i++){
				%>
					<a href="boardList.jsp?pageNum=<%=i %>">[<%=i %>]</a>
				<%
			}// for end
		
		//[다음]
			if(endPage < pageCount){
				%>
					<a href="boardList.jsp?pageNum=<%=endPage+1 %>">[Next]</a>
				<%
			}// if end
		} // paging if end
		
		//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		%>
	</table>



</body>
</html>