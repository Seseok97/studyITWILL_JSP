<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>cookieDel.jsp</h1>
<h2>쿠키정보 삭제(서버)</h2>
<%
// 쿠키는 invalidate()같은 초기화 메소드가 없다 !!!!!!
// 쿠키값 가져오기 >> 쿠폰이 있어야 버릴수가 있다 !
Cookie[] cookies = request.getCookies();

if(cookies!= null){
	for(int i=0;i<cookies.length;i++){
		// 원하는 쿠키만 검색
		if(cookies[i].getName().equals("name")){
			//쿠키값 삭제
			cookies[i].setMaxAge(0); // 쿠키 유효기간 만료
			// 단, 해당 상태는 서버에만 적용되어 있다.
			
			//클라이언트에게 변경된 정보를 저장하여 전달.
			response.addCookie(cookies[i]);
		}
	}
}

//세션과 문법이나 사용법에서 차이를 보이고 있다 !!
%>

<script type="text/javascript">
alert("쿠키값 삭제완료 !");
location.href="cookieTest.jsp";
</script>


</body>
</html>