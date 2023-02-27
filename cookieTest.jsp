<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>cookieTest.jsp</h1>
<h2>클라이언트</h2>

<!-- 세션과 쿠키를 카페쿠폰에 비교하자면, 세션은 가입해서 쓰는 쿠폰같은거고, 쿠키는 도장짝는 쿠폰같은거다 ! -->
<!-- 값 > 변수 > 배열
	  실행문 > 메서드 > 함수 
	  >> 둘다 합하면 클래스 >> 생성자는 왜 필요한가 ? 집가서 확인하기.
	  cookie와 세션은 저장영역이 다르다 !!!
	  -->
<% 	 

	//쿠키: 서버와 클라이언트의 상태를 저장하는 정보.
	//	> 상태정보를 클라이언트의 HDD에 저장 ! 
	// 이름, 값, 유효기간, 도메인, 경로 ... 형태로 구성됨.
	// 쿠키이름(알파벳,숫자조합)
	// 쿠키 생성 > 쿠폰 생성, 서블릿 API를 통한 구현
	// Cookie cookie = new Cookie(이름,값);
	
%>

<input type="button" value="쿠키값 생성"
		onclick="location.href='cookieSet.jsp';">
		<hr>
		
<%
	//생성된 쿠키값(정보) 가져오기
	Cookie[] cookies = request.getCookies(); 
	// .getCookies() 메소드가 배열을 리턴하기때문에 배열로 받아야 한다.
	// 쿠키 배열을 불러올때는 어레이넘버보다 이름을 가져온다.
	
	//배열에 들어있는 이름이 내가 만든 쿠키인지 체크해보자.
	if(cookies != null){
		for(int i=0;i<cookies.length;i++){
			if(cookies[i].getName().equals("name")){
				// 내가만든 쿠키가 있다.
				 out.print("내가 만든 쿠키 이름: "+cookies[i].getName()+"이다.<br>");
				 out.print("내가 만든 쿠키 값: "+cookies[i].getValue()+"이다.<br>");
				
			}
		}
	}
%>
		<hr>
<input type="button" value="쿠키값 삭제"
		onclick="location.href='cookieDel.jsp';">
		<hr>


</body>
</html>