<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>operatorTestPro.jsp</h1>
	<!-- el 표현식을 사용한 정보 출력 -->
	숫자1: ${param.num1 }<br>
	숫자2: ${param.num2 }<br>
	
	<hr>
	<h2>el 표현식의 연산</h2>
	
	<ul>
		<li><b>잘못된 예시:</b> 숫자 1 + 숫자 2 = ${param.num1 } + ${ param.num2 }</li>
		<li>el 표현식의 연산은 괄호 안에서 실행된다.</li>
	</ul>
	<ol>
		<li>+ = ${param.num1 + param.num2 }</li>
		<li>- = ${param.num1 - param.num2 }</li>
		<li>* = ${param.num1 * param.num2 }</li>
		<li>/ = ${param.num1 / param.num2 }</li>
		<li>% = ${param.num1 % param.num2 }</li>
	</ol>
	<hr>
	<h3>숫자 1, 숫자 2  >  양수?음수?</h3>
	${param.num1 > 0 }<br>
	${param.num2 > 0 }<br>
	= ${(param.num1 > 0) && (param.num2 > 0) }<br>
	
	<p>>> el 표현식은 비교연산, 논리연산이 가능하다.</p>
	<hr>
	<h3>숫자 데이터타입에 따른 '양수','음수' 구분(el 표현식은 삼항연산자 사용이 가능하다.)</h3>
<%-- 	<%if(%>${param.num1 } > 0<%) {}%>  // >> 스크립틀릿 열어서 조건식 안에 el 넣는거는 작동못하나 ,,--%>
	숫자1: ${(param.num1>0)? "양수":"음수" }<br>
	숫자2: ${(param.num2>0)? "양수":"음수" }<br>
<%-- 	${param.num1 = 0 }<br> --%>
<%-- 	${param.num2 = 0 }<br> --%>
<%-- 	${param.num1 < 0 }<br> --%>
<%-- 	${param.num2 < 0 }<br> --%>
	
	<hr>
	<h3>연습</h3>
	<!-- test페이지에서 ID 정보를 하나 입력받는다. -->
	<!-- ID를 정상 입력한 경우 : "'000'님, 안녕하세요!" 출력 -->
	<!-- ID 미입력의 경우: "게스트님, 안녕하세요!" 출력 -->
	
	ID: ${param.id }<br>
	1. ${(param.id == "")? "게스트":param.id}님, 안녕하세요!<br>
<%-- 	2. ${(param.id.equals(""))? "게스트":param.id}님, 안녕하세요!<br> // 버그 에러로 인한 주석처리, 지워도 상관없음 --%>
	3. ${(empty param.id)? "게스트":param.id}님, 안녕하세요!<br>
	
	<hr>
	<h3>el 연산자</h3>
	== : eq <br>
	!= : ne <br>
	>  : gt <br>
	<  : lt <br>
	>= : ge <br>
	<= : le <br>
	<p>>> 왜 연산자를 굳~이 글자로?? : 기호와 겹치는 경우가 생기기 때문!!</p>
	
	eq: ${(param.id eq(""))? "게스트":param.id}님, 안녕하세요!<br>
	<br>
	
	<!-- xml 형태에서 사용
			> CDATA  > Character DATA		 > 문자 데이터를 그대로 읽기.
			> PCDATA > Parsed Character DATA > 문자 데이터를 파싱해서 읽기.
	
	 -->
	<![CDATA[
		숫자1: ${(param.num1 gt 0)? "양수":"음수" } <br>
		숫자2: ${(param.num2 gt 0)? "양수":"음수" } <br>
	]]>
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	

</body>
</html>