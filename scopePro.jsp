<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<h1>scopePro.jsp</h1>
		<%
			//사용자가 입력한 ID정보 출력
			String id = request.getParameter("id");
		
			//영역객체 scopeObject에 데이터를 저장
			pageContext.setAttribute("p", "pageScope Value!");
			request.setAttribute("r","request Value!");
			session.setAttribute("s","session Value!");
			application.setAttribute("a","application Value!");
			
			//사용자의 pw 저장
			String pw = request.getParameter("pw");
	
		%>
		
			User ID: <%=id %><hr>
			
			pageContext 내장객체 값 : <%=pageContext.getAttribute("p") %>	<br>
			request 내장객체 값 : <%=request.getAttribute("r") %>		<br>
			session 내장객체 값 : <%=session.getAttribute("s") %>		<br>
			application 내장객체 값 : <%=application.getAttribute("a") %>	<br>
			<hr>
			
			<h2>페이지 이동</h2>
			
			<h2>HTML - a태그 + href : parameter, session, application 접근 가능</h2>
			<a href="scopeAction.jsp?id=<%=id%>&pw=1234">scopeAction.jsp 페이지로 이동</a>
			
			<h2>JS - location객체 : </h2>
			<script type="text/javascript">
// 				alert("js page move"); // location만 사용하면 확 넘어가버려서 얼러트창 넣어줌. // 주석처리
<%-- 				location.href="scopeAction.jsp?id=<%=id %>&pw=1234"; --%>
			</script>
			
			<h2>JSP - response객체 : </h2>
		<%
// 				response.sendRedirect("scopeAction.jsp?id="+id+"&pw=1234"); // 액션태그 실습을 위해 주석처리
			// 위 세가지 방식 모두 get: 주소창을 통해서 정보를 전달하는 방식이다.
			// html,js는 모두 href + jsp코드로 실행해야 하고,
			// jsp 는 sendRedirect를 통해 주소창을 연결하고, java처럼 문자열의 연결자를 활용하여 전달하면 된다.
			
			//이 때 위에 js코드 를 주석처리를 하지 않고 실행했을때 얼러트창이 출력되지 않는데 -!!!		
			//JSP 페이지 = HTML + JS + JSP(JAVA) 구조는 이와 같고,
			//실행순서 1> JSP(JAVA)
			//		   2> HTML
			//		   3> JS
			// 위와 같기 때문 !! 정해진 규칙임.
			
			// 그러니까, JSP 코드에서 이미 sendRedirect() 메서드가 실행되어 페이지가 넘어갔기 때문이다 !!!
			
			// >> JSP / JS를 같이 사용할 때는, 페이지이동 메서드는 하나만 사용해야 한다 !!
			// js > alert창 출력 후 이동 // jsp > 그냥 날라가기
		%>
			<h2>액션태그 - forward : parameter,request,session,application</h2>
			<jsp:forward page="scopeAction.jsp"/>
			<!-- 포워딩: 1)request 영역의 데이터를 사용 가능.
						 2)주소변경 바뀌지 않는 반면, 화면 변경되어 나타난다. .... 왜 굳이 ??
						 >> 해당 주소가 아닌 다른 주소를 표시시키기 위해 의도적으로 사용하는 경우가 있다.
						 >>> 이유는 차차 알아가고, 이런게 있다는걸 알아두기 !
						 >작동원리는 차차배움
						 			 -->
						 			 
			<>
			
			
			

</body>
</html>