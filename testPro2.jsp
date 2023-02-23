<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>testPro2.jsp</h1>

	 			<%
// 			String name = request.getParameter("name");
// 			int age = Integer.parseInt(request.getParameter("age"));
		 			%><br>
<%-- 			이름: <%=name+"님" %>	<br> --%>
<%-- 			나이: <%=age+"세" %>	<br> --%>
				<%
// 			if(age < 20){
// 				out.println("미성년자");
// 			}else{
// 				out.println("성인");
// 			}
				//  하다가 잘 안되서 아래에 다시 함
				%>

			<%
			// form태그. post방식으로 정보 전달시 한글 깨짐 !!! 
			// >> 한글로 인코딩 필요
			
			//한글처리 // 파라미터 저장 이전에 실행 되어야 한다.
			request.setCharacterEncoding("UTF-8");
			// > body에 담아서 전달하기때문에 깨지는 현상이 발생한다.(body에는 인코딩하라는 명령이 없었기 때문 !!)
			
			//파라미터 저장
			String name = request.getParameter("name");
			String age = request.getParameter("age");
			int age2 = Integer.parseInt(age);
			%>
			이름: <%=name %> 나이: <%=age2 %> <br>
	 			<% 
// 			if(age2>=20){
// 				out.print(name+"님은 성인입니다.<br>");
// 			}else{
// 				out.print(name+"님은 미성년자입니다.<br>");
// 			}
 				%> 
			<%if(age2>=20){ %>
			<%=name %>님은 성인입니다!		<br>
			<%}else{ %>
			<%=name %>님은 미성년자입니다!	<br>
			<%} 
			// 강사님이 이렇게도 가능하다고 하셨다.%>



</body>
</html>