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
	<h1>insertPro.jsp</h1>
	<!-- DB로 정보 넘기기 -->>
	<%
	//한글처리
	request.setCharacterEncoding("UTF-8");
	//전달정보 저장
	// > 액션태그 활용
	%>
	
	<jsp:useBean id="mb" class="com.itwillbs.member.MemberBean"/>
	
	<jsp:setProperty property="*" name="mb"/>
	
	<%
	//회원가입 날짜정보를 regDate에 저장
	mb.setRegDate(new Date(System.currentTimeMillis()));
	%>
	<%=mb %>
	<h2>전달받은 정보를 itwill_member테이블에 저장</h2>
	<%
	//1. 드라이버 로드
	final String DRIVER = "com.mysql.cj.jdbc.Driver";
	final String DBURL = "jdbc:mysql://localhost:3306/jspdb";
	final String DBID = "root";
	final String DBPW = "1234";
	Class.forName(DRIVER);
	System.out.println("드라이버 로드 성공!");
		// 위 내용은 매번 사용하고 있는데, 이걸 줄이는 방법은? >> class파일 별도로 생성해서 써먹으면 되겄지 ~~
	//2. 디비연결
	Connection con =
		DriverManager.getConnection(DBURL, DBID, DBPW);
	System.out.println("DB연결 성공!");
	System.out.println(con);
	//3. sql(insert) 작성 & pstmt 객체
	String sql=
		"insert into itwill_member (id,pw,name,gender,email,age,regDate) values(?,?,?,?,?,?,?)";
	PreparedStatement pstmt = con.prepareStatement(sql);
	
	// 물음표 채우기
	pstmt.setString(1, mb.getId());
	pstmt.setString(2, mb.getPw());
	pstmt.setString(3, mb.getName());
	pstmt.setString(4, mb.getGender());
	pstmt.setString(5, mb.getEmail());
	pstmt.setInt(6, mb.getAge());
	pstmt.setDate(7, mb.getRegDate());
	
	//4. sql 실행
	pstmt.executeUpdate();
	
	System.out.println("회원 가입 성공!(insert 성공!)");
	
	%>
	<script type="text/javascript">
	//로그인 페이지로 이동
		alert("회원가입 성공!");
	// alert창 활용을 위해서 js를 이용한다.
		location.href = 'loginForm.jsp';
	</script>
	
	
	
	
	
	
</body>
</html>