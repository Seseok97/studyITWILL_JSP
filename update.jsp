<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Driver"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>update.jsp</h1>
	<!-- 기존의 정보를(select) 수정(update)하는 행동. -->
	<!-- NULL값도 포함한다 !!! -->

<%
	//기존에 저장된 특정 아이디의 정보(이름, 성별, 나이 수정)	

	//DB연결정보(상수)
	final String DRIVER = "com.mysql.cj.jdbc.Driver";
	final String DBURL = "jdbc:mysql://localhost:3306/jspdb";
	final String DBID = "root";
	final String DBPW = "1234";

	//1. 드라이버 로드
	Class.forName(DRIVER);
	System.out.println("드라이버 로드 성공!");
	//2. 디비연결
	Connection con=
	DriverManager.getConnection(DBURL,DBID,DBPW);
	System.out.println("디비연결 성공!");
	//3. sql 작성 & pstmt 객체 생성
	// 기존에 저장된 특정 아이디의 정보(이름, 성별, 나이 수정)	
	String sql = "update itwill_member set name=?,gender=?,age=? where id=?";
	//JSP로 쿼리를 작성하는 경우, 자바 문법 위에서 작성하다 보니 실수가 많이 생긴다 !!!!
	// 워크벤치로 가서 실행 해 보고 입력하는게 좋다 !
	PreparedStatement pstmt = con.prepareStatement(sql);
	
	//?,?,? >> 채우기
	pstmt.setString(1, "아이티윌(수정)");
	pstmt.setString(2, "남자");
	pstmt.setInt(3, 20);
	pstmt.setString(4,"admin");
	
	//4. sql 실행
	
	// 다시해보기.
	pstmt.setString(1, "홍진호");
	pstmt.setString(2, "남자");
	pstmt.setInt(3, 22);
	pstmt.setString(4,"jsptest");
	
	pstmt.executeUpdate();
	System.out.println("수정 완료!");



%>



















</body>
</html>