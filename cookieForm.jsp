<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>cookieForm.jsp</h1>
		<%
	Cookie[] cookie=request.getCookies();
	out.print(cookie[0].getValue());
	String alert="No cookie";
	
	//checked를 위한 변수 lang
	String lang = ""; // 쿠키의 언어설정 정보를 저장
	
	
	
	if(cookie[0].getValue().equals("kor")){
		alert = "안녕하세요! 쿠키연습입니다!";
		lang = cookie[0].getValue(); // kor
	}
	if(cookie[0].getValue().equals("eng")){
		alert = "Hello! CookieTest!";
		lang = cookie[0].getValue(); // eng
	}

// 	if(cookies != null){
// 		for(int i=0;i<cookies.length;i++){
// 			//쿠키명 - lang인 쿠키정보 찾기
// 			if(cookies[i].getName().equals("lang")){
// 				// 쿠키 메세지 출력
// 				if(cookies[i].getValue().equals("kor")){
// 					out.print("kormsg <br>");
// 				}else{
// 					out.print("engmsg <br>");
// 				}
// 			}
// 		}
// 	}
// 강사님 코드 ,, 완전 다른데 ??
	
	
	%>
	
	<form action="cookiePro.jsp" method="get" onsubmit="hi();">
		<fieldset>
			<input type="radio" name="language" value="kor" 
			<%if(lang.equals("kor")){ %>
			checked="checked"
			<%} %>
			> 한국어
			<input type="radio" name="language" value="eng" 
			<%if(lang.equals("eng")){ %>
			checked="checked"
			<%} %>
			> 영어
				<hr>
			<input type="submit" value="언어설정">
		</fieldset>
	</form>
	<!-- 언어 설정
			한국어: "안녕하세요! 쿠키연습입니다!"
			영아: "Hello! CookieTest!"
		단, 브라우저가 종료된 후 재시작 하여도 언어가 유지되도록 하라.	
	 -->
	
	<script type="text/javascript">
	function hi(){
		alert("<%=alert %>");
	}
	</script>
	
</body>
</html>