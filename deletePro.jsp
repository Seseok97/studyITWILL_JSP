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
	<h1>deletePro.jsp</h1>
	<%
	//한글처리
	request.setCharacterEncoding("UTF-8");
	
	//세선에서 아이디 정보 가져오기.
// 	String id = session.getAttribute("id"); //Err, Type mismatch: cannot convert from Object to String // 객체는 문자열로 바꿀수 없다.
// 	String id = (String)session.getAttribute("id");	// 강제형변환(상속을 배우고 나서 하는거 !! downcasting)
	// 원래는 세션에서 가져 와야하는데, 세션을 따로 생성하면서 학습하고있지 않기 때문에 받은값으로 진행.

	//전달정보 저장(id,pw)
	String id = request.getParameter("id"); // (실무)아이디정보는 세션에서 가져와야 한다.
	String pw = request.getParameter("pw");
	
	//DB연결정보(상수)
	final String DRIVER = "com.mysql.cj.jdbc.Driver";
	final String DBURL = "jdbc:mysql://localhost:3306/jspdb";
	final String DBID = "root";
	final String DBPW = "1234";
	
	//디비에 저장된 회원정보중에서 일치하는 회원정보를 삭제하라.
	
	//1. 드라이버 로드
	Class.forName(DRIVER);
	System.out.println("드라이버 로드 성공"); // 이런 확인지점이 있어야 에러가 발생해도 금방 찾을 수 있다 !
	//2. 디비 연결
	Connection con =
		DriverManager.getConnection(DBURL,DBID,DBPW);
	System.out.println("DB Connection 성공");
	//3. SQL구문(쿼리, select) 작성 & pstmt 객체 생성
	// 회원 / 비회원 체크
	String sql ="select pw from itwill_member where id=?";
	PreparedStatement pstmt = con.prepareStatement(sql);
	
	pstmt.setString(1,id);
	//4. SQL구문(쿼리) 실행
	ResultSet rs = pstmt.executeQuery();
	//5. 데이터 처리 > 삭제
	if(rs.next()){			// rs.next() >> EOF에 도달하면 false, '*' 불러오기에서는 true ;; 나중에 설명.
		// DATA O > 비밀번호 비교
		if(pw.equals(rs.getString("pw"))){ // "pw" == colunm name.
			//id와 비밀번호가 같은 경우 >> 탈퇴 가능 > 삭제
			//1,2 단계는 완료되었기 때문에, 3단계부터 실행하면 된다.
			//3. SQL구문(쿼리, select) 작성 & pstmt 객체 생성 
			sql = "delete from itwill_member where id=?";
			pstmt = con.prepareStatement(sql); 
			// 위 코드가 없이 실행하게 되면 위에서 실행한 sql구문이 초기화되지않고 불러와지게된다. >> 귀찮아도 한번 해줘야함.
			pstmt.setString(1,id);
			//4. SQL 실행
			pstmt.executeUpdate();
			
			System.out.println("삭제 성공!");
			
		}else{
			//id는 같으나 비밀번호는 다른 경우
			System.out.println("탈퇴 실패! 사유: 비밀번호가 잘못되었습니다.");
		}
		
	}else{
		//DATA X
		System.out.println("탈퇴 실패! 사유: 비회원입니다.");
	}
	
	
	%>

</body>
</html>