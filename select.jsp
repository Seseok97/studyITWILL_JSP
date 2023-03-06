<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
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
<h1>select.jsp</h1>
<h2>MySQL에 저장된 회원정보 출력(id,pw,email)</h2>


<%
//한글처리
	request.setCharacterEncoding("UTF-8");
//1. DB에서 데이터 가져오기
	//DB연결정보(상수)
	final String DRIVER = "com.mysql.cj.jdbc.Driver";
	final String DBURL = "jdbc:mysql://localhost:3306/jspdb";
	final String DBID = "root";
	final String DBPW = "1234";
	//1
	Class.forName(DRIVER);
	System.out.println("드라이버 로드 성공!");
	//2
	Connection con = DriverManager.getConnection(DBURL,DBID,DBPW);
	System.out.println("DB연결 성공!");
	System.out.println(con);
	//3
	//SQL쿼리 작성 + pstmt객체 생성
	//모든정보 조회 > select 구문
// 	String sql  = "select * from jspdb";
	String sql  = "select * from itwill_member";
	PreparedStatement pstmt = con.prepareStatement(sql);
// 	pstmt.setString(parameterIndex, x); // 물음표 없어서 안해도 됨!
	//4
// 	pstmt.executeUpdate(); // insert, select구문이기때문에 사용 안함!
// 	pstmt.executeQuery(); // 정보조회요청이기 때문에 쿼리!
	
	//.executeUpdate()	: insert, update, delete : DB를 조작할때
	//.executeQuery()	: select 				 : DB를 조회할때
	// >> 데이터에 변경이 발생하는지를 기준으로 생각하면 됨!
	
	//아직 출력은 안된다.
	ResultSet rs = pstmt.executeQuery(); // 결과값 rs(import문 필요)에 쿼리결과를 저장하고

	System.out.println("데이터 조회");

//2. 데이터 출력하기.(BOF = 파일시작 / EOF = 파일 끝)
	//5
// 	if(rs.next()){ 				// SQL실행의 결과 데이터가 있을때
		//rs.next() > rs의 커서를 한칸 아래로 옮긴다.
		// 왜 넥스트? >> DB를 가져오면 일단 BOF를 지정하고 있기 때문!!
// 		System.out.println(rs.getString("id"));//id값을 출력시킨다. 데이터타입 필요.
		// BOF의 한칸 아래, 그러니까 rs의 첫번째 데이터를 지정한 거고,
		// 	해당 데이터의 id값을 출력한것 !
		// DB가 끝나는지점에 커서가 도달하면 > EOF를 지정하게됨. > 종료
		
// 		System.out.println(rs.getString(0)); //Err
// 		System.out.println(rs.getString(1)); // id
// 		System.out.println(rs.getString(2)); // pw >> 컬럼의 인덱스는 1부터 시작한다!
// 		System.out.println(rs.getString(3)); // name	> null
// 		System.out.println(rs.getString(4)); // gender	> null
// 		System.out.println(rs.getString(5)); // age		> null
// 		System.out.println(rs.getString(6)); // email
		// 컬럼명을 입력하는것보다 인덱스넘버 입력이 더 빠르다 !!
		// 실무에서는 인덱스넘버 사용이 보편적이지만 ! 우리는 수업해야하니까 컬럼명으로 한다.
		
// 		out.println("아이디: "+rs.getString("id")+"<br>"); 
// 		out.println("비밀번호: "+rs.getString("pw")+"<br>"); 
// 		out.println("이메일: "+rs.getString("email")+"<br>"); 
// 	} // 반복문 사용을 위해 주석처리

	while(rs.next()){ // next()는 한칸씩 커서를 내리고, EOF에 도달하면 false가 되기때문에 자동으로 종료된다.
		out.println("아이디: "+rs.getString("id")+"<br>"); 
 		out.println("비밀번호: "+rs.getString("pw")+"<br>"); 
 		out.println("이메일: "+rs.getString("email")+"<br>");
 		out.println("<br>");
	}
	
	

%>


</body>
</html>