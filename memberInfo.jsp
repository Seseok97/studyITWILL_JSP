<%@page import="com.itwillbs.member.MemberBean"%>
<%@page import="java.sql.ResultSet"%>
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
	<h1>memberInfo.jsp</h1>
	<h2>회원가입시 입력했던 정보 출력.</h2>
	<%
// 	로그인 세션 제어(로그인 했을때만 사용 가능.)
	String id = (String)session.getAttribute("id");
	if(id == null){
// 		response.sendRedirect("loginForm.jsp"); // session, application (영역객체 중 2가지)를 사용하여 정보 전달이 가능하다. Parameter 도 가능 !
		//전달해야할 정보: 페이지 주소
		// 방법 선택
		//1. application > 실행중인 프로젝트 전체에 정보를 공유한다.
		//2. session > 서버가 켜진동안 모든 동일한 브라우저에 정보를 공유한다.
			//https://order.pay.naver.com/orderSheet/01f28bcf-a5e5-4848-8736-d1316d766df8/
			//integrationCart?
			//backUrl=https%3A%2F%2F
			//shopping.naver.com%2F
			//logistics%2F
			//products%2F
			//526442697%3FNaPm%3Dct%253Dlf65tn8a%257Cci%253Dshoppingwindow%257Ctr%253Davgtc%257Chk%253D6a58c066020ada4c7ad51a6944aad4d27fa8e68c%257Ctrx%253D
			// 네이버쇼핑에서 정보를 전달하는 방식(전부는 아님 !)
			// parameter로 이동하는 방식을 참고 !!
		// >> Parameter 활용
		response.sendRedirect("loginForm.jsp?oldURL="+request.getRequestURL());	// URL 주소를 나타내어 준다.
// 		response.sendRedirect("loginForm.jsp?oldURL="+request.getRemoteAddr());	// localhost의 주소를 나태내어준다.
	}
	//memberInfo
	
	//로그인한 회원의 정보를 화면에 출력!
	
	//디비연결 정보
	
	//1. 드라이버 로드
	final String DRIVER = "com.mysql.cj.jdbc.Driver";
	final String DBURL = "jdbc:mysql://localhost:3306/jspdb";
	final String DBID = "root";
	final String DBPW = "1234";
	Class.forName(DRIVER);
	System.out.println("드라이버 로드 성공!(memberInfo)");
	//2. DB 연결
	Connection con =
		DriverManager.getConnection(DBURL, DBID, DBPW);
	System.out.println("DB연결 성공!(memberInfo)");
	System.out.println(con);
	
	// 3. sql작성(select) & pstmt 객체
	String sql =
		"select * From itwill_member where id=?";
	PreparedStatement pstmt = con.prepareStatement(sql);
	
	// 물음표채우기
	pstmt.setString(1, id);
	
	//4. sql 실행
	ResultSet rs = pstmt.executeQuery();
	
	//MemberBean 객체 생성
	MemberBean mb = new MemberBean();
	
	//5. 데이터 처리(정보 출력)
	if(rs.next()){
		
		// rs데이터 >> MemberBean으로 저장 ! >> 데이터 이동이 쉬워짐.
		mb.setId(rs.getString("id"));
		mb.setPw(rs.getString("pw"));
		mb.setName(rs.getString("name"));
		mb.setGender(rs.getString("gender"));
		mb.setAge(rs.getInt("age"));
		mb.setEmail(rs.getString("email"));
		mb.setRegDate(rs.getDate("regdate"));
		
		out.print("아이디: "+rs.getString("id"));
			%>
			비밀번호: <%=rs.getString("pw") %><br>
		<% // 스크립틀릿 많이쓰면 코드가독성 떨어짐
	}
//아래 테이블을 채우기 위해서  스크립틀릿 안으로 table식을 넣는 방법은 있지만(끊어진 부분에 넣는것) 좋지않다 !
// 아래 td태그 안에 Bean 처리된 스크립틀릿 표현식을 넣으면 됨 !

//rs로 해도 결과는 같게 나오는데, mb로 사용하는건 보안을 위해서 ?? 아니면 값을 한번 저장해두기 위함 ..??
%>

			

<table border="1">
	<tr>
		<td>아이디</td>
		<td><%=rs.getString("id") %></td>
	</tr>
	<tr>
		<td>비밀번호</td>
		<td><%=mb.getPw() %></td>
	</tr>
	<tr>
		<td>이름</td>
		<td><%=mb.getName() %></td>
	</tr>
	<tr>
		<td>성별</td>
		<td><%=mb.getGender() %></td>
	</tr>
	<tr>
		<td>나이</td>
		<td><%=mb.getAge() %></td>
	</tr>
	<tr>
		<td>이메일</td>
		<td><%=mb.getEmail() %></td>
	</tr>
	<tr>
		<td>가입날짜</td>
		<td><%=mb.getRegDate() %></td>
	</tr>
	
</table>

<h2><a href="main.jsp">메인페이지로</a></h2>





















</body>
</html>