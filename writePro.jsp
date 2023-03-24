<%@page import="com.itwillbs.board.BoardDAO"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>writePro.jsp</h1>
	<h2>전달받은 정보를 DB에 저장</h2>
	<%
	request.setCharacterEncoding("UTF-8");
	
	// 전달정보 저장(액션태그+자바빈(DTO))
	%>
	<jsp:useBean id="dto" class="com.itwillbs.board.BoardDTO"/>
	<jsp:setProperty property="*" name="dto"/>
	<%
	// dto에 추가정보를 저장
// 	//		현재날짜
// 	dto.setDate(new Date(System.currentTimeMillis()));
	//		IP 주소
	dto.setIp(request.getRemoteAddr());
	System.out.println(dto.getIp());
	
	//BoardDAO 객체 생성
	BoardDAO dao = new BoardDAO();
	
	// 게시판 글쓰기.(BoardDAO에서 생성된 객체를 불러온것.)
	dao.insertBoard(dto); // 안에 dto(액션태그를 통하여 저장한 값)를 넣는다.

	//페이지 이동
	response.sendRedirect("boardList.jsp");
	
// 	sql=
// 		"insert into itwill_board (name,pass,subject,content,date,ip,file) values(?,?,?,?,?,?,?)";
// 	PreparedStatement pstmt2 = con.prepareStatement(sql2);
	
// 	pstmt2.setString(1, dto.getName());
	%>

</body>
</html>





















