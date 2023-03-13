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
<h1>loginPro.jsp</h1>
	<%
	//한글처리
	request.setCharacterEncoding("UTF-8");
	//정보 저장(보통 데이터 한두개는 JAVA코드로 하는 경우도 있다 !)
	//액션태그 사용.
	
	//이전의 페이지 주소
	String oldURL = request.getParameter("oldURL");
// 	System.out.println("oldURL: "+oldURL);
// 	System.out.println(oldURL+000); // 데이터타입 확인
	
	%>
	<jsp:useBean id="mb" class="com.itwillbs.member.MemberBean"/>
	<jsp:setProperty property="*" name="mb"/>

	<%
	// 디비 접근 > 회원정보 조회
	// 1) 아이디 유무, 2) 비밀번호 비교
	
	//1. 드라이버 로드
	final String DRIVER = "com.mysql.cj.jdbc.Driver";
	final String DBURL = "jdbc:mysql://localhost:3306/jspdb";
	final String DBID = "root";
	final String DBPW = "1234";
	Class.forName(DRIVER);
	System.out.println("드라이버 로드 성공!");
	//2. DB 연결
	Connection con =
		DriverManager.getConnection(DBURL, DBID, DBPW);
	System.out.println("DB연결 성공!");
	System.out.println(con);
	//3. sql query 작성(select) & pstmt객체 > 회원유무 확인
	String sql=
		"select pw from itwill_member where id=?";
	PreparedStatement pstmt = con.prepareStatement(sql);
	
	pstmt.setString(1,mb.getId());
	
	//4. sql 실행
	ResultSet rs = pstmt.executeQuery();
	//5. 데이터 처리
// 	session.setAttribute("loginInfo", false); // 사용 가능하지만, session에 id 를 그냥 들고 다니는 경우도 많다.
	
	if(rs.next()){
		//회원 > 비밀번호 비교
		if(mb.getPw().equals(rs.getString("pw"))){
			//회원 > 비밀번호 같음 >> 로그인 성공
			// 회원의 아이디정보를 세션에 저장하고, main.jsp로 이동
// 			session.setAttribute("loginInfo", true); // 사용 가능하지만, session에 id 를 그냥 들고 다니는 경우도 많다.
			session.setAttribute("id",mb.getId());
// 			response.sendRedirect("main.jsp"); // 강사님은 이거로 페이지 이동. > 이전페이지가 없을때 !
			if(oldURL.equals("null")){
			%>
			<script type="text/javascript">
				alert("로그인 성공!");
				location.href ="main.jsp";
				// 이쪽도 문제없이 세션 저장 가능
			</script>
			
			<%
			}else{
				response.sendRedirect(oldURL); // > 이전 페이지가 있을때.	
			}
		}else{
			//회원 > 비밀번호 다름 >> 로그인 실패
			// alert메세지 + 페이지 뒤로가기.
			%>
			<script type="text/javascript">
				alert("비밀번호 오류!");
				history.back();
			</script>
			<%
		}
	}else{
		//비회원 > 로그인 실패
		// alert메세지 + 페이지 뒤로가기.
		%>
		<script type="text/javascript">
// 			alert("아이디 오류!");
// 			confirm("아이디 오류! 회원가입 하시겠습니까?"); // 취소창 생김 > Y/N 선택 가능
			var tmp = 
				confirm("아이디 오류! 회원가입 하시겠습니까?"); // 이렇게 하면 되구나 ~
			// 아이디 X > 회원가입 페이지
			// 아이디 O(오타) > 로그인 페이지
// 			alert(tmp); // 확인true/취소flase !!
			// 얼럿창으로 인한 주석처리
			
			if(tmp){
				location.href="insertForm.jsp";
			}else{
				location.href="loginForm.jsp";	// input태그에 입력했던 정보 초기화
// 				history.back(); // input태그에 입력했던 정보 유지
			}
		</script>
		<%
	}


	%>


</body>
</html>