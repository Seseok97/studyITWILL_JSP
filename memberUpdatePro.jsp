<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>memberUpdatePro.jsp</h1>
	<%
	//로그인 세션제어
	String id = (String)session.getAttribute("id");
	if(id == null){
		response.sendRedirect("loginForm.jsp?oldURL="+request.getRequestURL());
	}
	//한글처리
	request.setCharacterEncoding("UTF-8");
	//전달정보 저장(수정을 진행할 데이터!)
	// > 액션태그 활용
	%>
	<jsp:useBean id="mb" class="com.itwillbs.member.MemberBean"/>
	<jsp:setProperty property="*" name="mb"/>
	<%
	//DB에 전달받은 정보를 수정
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
		"select * from itwill_member where pw=?";
	PreparedStatement pstmt = con.prepareStatement(sql);
	
	String pw = mb.getPw();
	
	if(pw == null){
		%>
		<script type="text/javascript">
			history.back();
		</script>
		<%;
	}
	pstmt.setString(1, mb.getPw());
	pstmt.executeQuery();
	System.out.println("pw비교 완료.");
	
	String sql2 = 
			"insert into itwill_member (name,gender,age) values(?,?,?)";
	PreparedStatement pstmt2 = con.prepareStatement(sql2);
	
	pstmt2.setString(1, mb.getName());
	pstmt2.setString(2, mb.getGender());
	pstmt2.setInt(3, mb.getAge());
	
	pstmt2.executeUpdate();
	System.out.println("회원정보 수정 완료.");
	
	
	
	//1. 회원 / 비회원
	//회원
	//비회원 (페이지 뒤로가기, session 제어 되어있기때문에 생략))
	// 회원 > 비밀번호 o, 비밀번호x
	// o > 회원정보 수정(이름, 나이, 성별) > 완료후 main.jsp 이동
	// x > 페이지 뒤로가기 > 재입력 가능하게 해야함.
	
	%>


</body>
</html>