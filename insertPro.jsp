<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
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
	<%
	//한글처리
	request.setCharacterEncoding("UTF-8");
	
	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
	String email = request.getParameter("email");
	
	// if문 활용해서 변수가 널값인지 확인하고, 널값이면 insertForm페이지로 돌아가게 만들었었는데,
	// 그렇게까지 할 건 아니라서 그냥 지웠음 !!
	
	%>
	
	<hr>
	아이디: <%=id %>	<br>
	비밀번호: <%=pw %>	<br>
	이메일: <%=email %>	<br>
	<hr>
	<h2>JDBC를 이용하여 정보를 MySQL에 저장</h2>
	<%
	//dbConnectTest.jsp 파일을 참고해서 실습해보자 !!
	
	//DB연결정보(상수)
	final String DRIVER = "com.mysql.cj.jdbc.Driver";
	final String DBURL = "jdbc:mysql://localhost:3306/jspdb";
	final String DBID = "root";
	final String DBPW = "1234";
	// final은 처음 봤는데 나중에 찾아보기.
	
	
	// 0. 드라이버 설치 > 앞으로는 생략될것임.(이미 설치 되어있다!)
	// 1. 드라이버 로드
	Class.forName(DRIVER);
	System.out.println("드라이버 로드 성공!");
	
	// 2. 드라이버 정보를 사용하여 DB연결
	// 주의! 여기서부터는 기본적인 java 기능에서 벗어나기때문에 ctrl+space로 입력하고 import시키면서 진행 해야 함!!
	Connection con = DriverManager.getConnection(DBURL, DBID, DBPW);
	System.out.println("DB연결 성공!");
	System.out.println(con);
	
	// 3. SQL 작성
	// 아이디, 비밀번호, 이메일 정보를 저장 ! > insert 구문
	// sql 쿼리문의 ';'은 생략한다.
// 	String sql="insert into itwill_member (id,pw,email) values('admin','2222','b@b.com')"; // Err, 500Error

// 	String sql="insert into itwill_member (id,pw,email) values('"+id+"','"+pw+"','"+email+"')"; // 보안상 좋지못하다 !!

	String sql="insert into itwill_member (id,pw,email) values(?,?,?)";	
	
	// sql실행 객체 Statement
// 	Statement stmt = new Statement(); //Err, Cannot instantiate the type Statement > 인터페이스 객체는 인스턴스화 할수 없다.

// 	Statement stmt = con.createStatement(); // Statement 객체를 생성해달라.
	
	PreparedStatement pstmt = con.prepareStatement(sql);
	//물음표값 채우기
	//pstmt.setXXXXX(n,abc) >> XXXXX: DB컬럼의 데이터타입.
	// varchar = String
	// int = int 이런식임
	//						>> n: 물음표의 위치
	//						>> abc: 들어갈 값
	pstmt.setString(1, id);
	pstmt.setString(2, pw);
	pstmt.setString(3, email);
	// 주의 ! '?'의 개수와 setXXX()의 개수는 동일해야한다!
	
	
	// 4. SQL 실행
// 	stmt.executeUpdate(sql);
	
	pstmt.executeUpdate();
	
	System.out.println("회원 가입 성공!(insert 성공!)");
	
	%>
	
	
</body>
</html>