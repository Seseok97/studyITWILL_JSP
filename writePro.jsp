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
	
	//DB연결
	//1. 드라이버 로드
	final String DRIVER = "com.mysql.cj.jdbc.Driver";
	final String DBURL = "jdbc:mysql://localhost:3306/jspdb";
	final String DBID = "root";
	final String DBPW = "1234";
	Class.forName(DRIVER);
	System.out.println("드라이버 로드 성공!");
	//2. 디비연결
	Connection con =
		DriverManager.getConnection(DBURL, DBID, DBPW);
	System.out.println("DB연결 성공!");
	System.out.println(con);
	//3. sql(insert) 작성 & pstmt 객체
	String sql = "select MAX(bno) from itwill_board";
	
	//4. 쿼리 실행
	PreparedStatement pstmt = con.prepareStatement(sql);
	
	ResultSet rs = pstmt.executeQuery();
	//5. 데이터 처리(글번호 최대값 +1)
	int bno = 0;
	if(rs.next()){
// 		bno = rs.getInt("MAX(bno)")+1 // 연산된 DB값을 가져오는 것 !!
		bno = rs.getInt(1) +1; // 번거롭기때문에 인덱스넘버로 적는거다!
		System.out.println("if");
	}
// 	else{
// 		bno = 1;
// 		System.out.println("else");
// 	}
	// getInt()에 Null값이 반환된 경우 0을 출력하기 때문에, else문은 없어도 상관없다 !!
	// 내장함수 호출시에는 칼럼명 보다는 인덱스넘버 접근이 유리하다.(성능차이!)
	// 내장함수를 사용한 값은 항상 true를 반환한다 !!!
	System.out.println("bno: "+ bno);
	
	// 정보 저장 (글쓰기)
	// 3단계부터 시작!
	// 3. sql 쿼리 작성 + pstmt
	sql = 
	"insert into itwill_board (bno,name,pass,subject,content,readcount,re_ref,re_lev,re_seq,date,ip,file) values (?,?,?,?,?,?,?,?,?,now(),?,?)";
	pstmt = con.prepareStatement(sql);
	
	pstmt.setInt(1, bno);
	pstmt.setString(2,dto.getName());
	pstmt.setString(3,dto.getPass());
	pstmt.setString(4,dto.getSubject());
	pstmt.setString(5,dto.getContent());
	
	pstmt.setInt(6,0); // 모든 글의 조회수는 0 초기화
	pstmt.setInt(7,bno);	//re_ref 그룹번호, 일반글번호 == 그룹번호
	pstmt.setInt(8,0);		//re_lev 레벨값  , 일반글 0
	pstmt.setInt(9,0);		//re_seq 순서값(시퀀스), 일반글 0
	// 10번째는 date가 들어갔기때문에, 10번째 물음표는 IP 주소가 들어가야 한다.
	pstmt.setString(10,dto.getIp());
	pstmt.setString(11,dto.getFile());
	// 4. 쿼리 실행
	pstmt.executeUpdate(); // Insert
	
	System.out.println("글쓰기 완료 !");
	
	
// 	sql=
// 		"insert into itwill_board (name,pass,subject,content,date,ip,file) values(?,?,?,?,?,?,?)";
// 	PreparedStatement pstmt2 = con.prepareStatement(sql2);
	
// 	pstmt2.setString(1, dto.getName());
	%>

</body>
</html>





















