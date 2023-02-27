<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>sessionLoginPro.jsp</h1>
<%!
//멤버변수 선언 >> 회원정보 저장
String DBID = "itwill";
String DBPW = "1234";
//> 이후에는 DB와 연동하여 사용
%>
<%
// 한글처리
request.setCharacterEncoding("UTF-8");
//
String id= request.getParameter("id");
String pw= request.getParameter("pw");

out.println("입력한 ID: "+id+"<br>");
out.println("입력한 PW: "+pw+"<br>");

// String checkId=(String)session.getAttribute("id2");
// String checkPw=(String)session.getAttribute("pw2");

// if(id == checkId){
// 	if(pw == checkPw){
// 		out.println("로그인 성공"+"<br>");
// 	}else{
// 		out.println("비밀번호 오류"+"<br>");
// 	}
// }else{
// 	out.println("아이디오류"+"<br>");
// }

//로그인 처리
// if(id == DBID){
// 	out.print("아이디 맞음");
// }
// 이게 왜 작동안하지 ????????
		
//로그인 처리 로직
// 1)사용자가 입력한 ID가 DB에 저장된 ID와 같은지 비교			
// 2 - 1) 같을때 >> 회원이다.

// 3) 비밀번호 비교

// 4 - 1) 같을때 >> 아이디, 비밀번호가 같다 ! > 본인확인 완료. > 로그인 정보를 모든 페이지에 공유 > 메인페이지(sessionMain.jsp)로 이동
// 4 - 2) 다를때 >> 아이디는 같으나 비밀번호가 다르다 ! > 본인이 아니다. > 로그인페이지로 재이동

// 2 - 2) 다를때 >> 비회원이다. > 로그인페이지로 재이동

session.setAttribute("loginInfo",false);

if(id.equals(DBID)){									//"==" 과 ".equals()"는 차이가 있는데, 문자열간의 비교는 equlas() 메소드를 사용해야 비교가 가능하다.
	if(pw.equals(DBPW)){								// ==는 주소값을 비교하는 원리고, equals()는 값만을 계산한다 !! equals() 사용해야함 !!
		out.println("로그인 성공"+"<br>");				// 근데 이거 지난번에 해본거같은데 까먹었다 ,,,,
		response.sendRedirect("sessionMain.jsp");
		session.setAttribute("loginInfo",true);
		session.setAttribute("id",id);
			}else{
				out.println("비밀번호 오류"+"<br>");
				session.setAttribute("loginInfo",false);
				%>
					<script type="text/javascript">
						alert("비밀번호 오류!");
						history.back(); 
					</script>
		
				<%
		// 		response.sendRedirect("sessionLoginForm.jsp");
			}
	}else{
		out.println("아이디오류"+"<br>");;
		session.setAttribute("loginInfo",false);
		%>
			<script type="text/javascript">
				alert("아이디 오류!");
				history.back(); // 뒤로가기 객체, 많이 사용함 !!
			</script>
	
		<%
	// 	response.sendRedirect("sessionLoginForm.jsp");
	}

		
		
		



%>

<script type="text/javascript">
</script>




</body>
</html>