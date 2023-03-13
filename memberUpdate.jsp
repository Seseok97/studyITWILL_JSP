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
	<script type="text/javascript">
		function checkData(){
			//ID check
			if(document.fr.pw.value == ""){
				alert("비밀번호를 입력하세요.");
				document.fr.pw.focus();
				return false;
			}
			
		}
	
	</script>
</head>
<body>
	<h1>memberUpdate.jsp</h1>
	<!--  회원가입 양식을 활용하여 정보수정페이지 제작 -->
	<%
	//로그인 제어
	
	//DB에 저장된 정보를 가져와서 화면에 출력 (비밀번호 제외)!
	String id = (String)session.getAttribute("id");
	if(id ==null){
		response.sendRedirect("loginForm.jsp?oldURL="+request.getRequestURL());
	}
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
		mb.setId(rs.getString("id"));
		mb.setPw(rs.getString("pw"));
		mb.setName(rs.getString("name"));
		mb.setGender(rs.getString("gender"));
		mb.setAge(rs.getInt("age"));
		mb.setEmail(rs.getString("email"));
		mb.setRegDate(rs.getDate("regdate"));
	}
	if(mb.getGender() == null || mb.getGender().equals("")){
		mb.setGender("남");
	}
	System.out.println("회원정보 조회 성공!");
	System.out.println(mb);
	%>
	
	
	<fieldset>
	<legend>Itwill member info update</legend>
		<form action="memberUpdatePro.jsp" method="post" name="fr" onsubmit="return checkData();">
		<!-- action 주소가 없는경우, 자신의 페이지를 호출한다. -->
			ID: <input type="text" name="id" value="<%=mb.getId() %>" readonly><br>
			<!-- readonly > 값 전달 가능, 수정 불가 -->
			<!-- disabled > 값 전달 불가, 수정 불가(태그 사용 불가) -->
			PW: <input type="password" name="pw"><br>
			Name: <input type="text" name="name" value="<%=mb.getName() %>"><br>
			Age: <input type="text" name="age" value="<%=mb.getAge() %>"><br>
			E-mail: <input type="text" name="email" value="<%=mb.getEmail() %>" readonly><br>
			<!--  이메일은 유니크 걸려있어서 수정 X!! -->
			Gender: 
<%-- 			<% --%>
<!-- // 			String checked1 = ""; -->
<!-- // 			String checked2 = ""; -->
<!-- // 				if(mb.getGender().equals("남")){ -->
<!-- // 					checked1 = "checked"; -->
<!-- // 				}else if(mb.getGender().equals("여")){ -->
<!-- // 					checked2 = "checked"; -->
<!-- // 				} // >> 내가 생각한 코드 -->
<%-- <%= checked1%> --%>
<%-- <%= checked2%> --%>
<%--  			%>  밑에 두개는 --%>
				Male<input type="radio" name="gender" value="남" 
				<%if(mb.getGender().equals("남")){ %>
					checked
				<%} %>
				>
				Female<input type="radio" name="gender" value="여" 
				<%if(mb.getGender().equals("여")){ %>
					checked
				<%} // 강사님코드%>
				><br>
			RegDate: <input type="text" name="regDate" value="<%=mb.getRegDate() %>"><br>
			
			<%
			//데이터 수정 로직
			//1. 데이터 수정 받기.
			//2. 수정된 데이터를 DB에 등록.
			%>
			
			
		<input type="submit" value="update">
		</form>
	</fieldset>

</body>
</html>