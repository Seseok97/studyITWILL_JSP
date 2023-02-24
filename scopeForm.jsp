<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>scopeForm.jsp</h1>
	<!-- p209 -->
	
	<%
	// 서블릿 >> JSP파일으로부터 변환되어서 실행되는 자바파일 > HTML파일 안에 스크립틀릿 등을 통해 java로 작성하잖아? 이게 java 파일로 변환된게 서블릿임.
	/*  
	영역객체(scope): 일정 범위에서 데이터를 공유하는 객체
	속성(attribute): 영역객체에서 공유되는 데이터
	
	영역Scope, 아래로 갈수록 범위 넓어짐
	> page			: 한 페이지 (서블릿 - jspService()메서드 실행되는 동안)
	> request		: 클라이언트의 요청이 처리되는 동안(액션태그include시)
	> session		: 세션이 유지되는 동안(웹브라우저당 1개) >ex) 다른페이지로 네이버 로그인 했는데, 새 탭 열기하면 그대로 로그인 되어있는거 >> 페이지끼리 세션정보를 공유한 것.
	> application	: 애플리케이션(서버)이 실행되는 동안
	
	? 왜 나누어서 관리하나 ?? 걍 하나로 모다서 저장하면 안됨?
	 >> 서버의 과도한 데이터 저장을 막기 위해서 !!
			
	영역객체
	> page			> pageContext 객체
	> request		> request 객체
	> session		> session 객체
	> application	> application 객체
	
	[영역객체].setAttribute("속성명attributeName",값value);		> 저장
	[영역객체].getAttribute("속성명attributeName");		> 불러오기
	[영역객체].removeAttribute("속성명attributeName");	> 삭제
	*/
	%>
	<fieldset>
		<form action="scopePro.jsp" method="get">
			ID: <input type="text" name="id"><br>
			<input type="submit" value="submit">
		</form>	
	</fieldset>
	
	
	
	
</body>
</html>