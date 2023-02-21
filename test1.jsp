<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
document.write("hello,world!"+"<br>");
// javascript 주석문
/*
 * javascript 주석문
 */


</script>
</head>
<body>
<h1>jsp1/test1.jsp</h1>
<h2>jsp = java + html + js</h2>

	<!-- 	html 주석문   -->
	
	<%
	//java 코드 작성하는 공간
	System.out.println("자바 코드 작성하는 법");
	int a = 100;
	System.out.println(a);
	//JAVA 주석
	%>
	
	<%-- JSP 코드 주석 넣는 공간 --%>
	
	<%
	//java 코드 작성
	// 문자열의 정보를 저장하는 배열 strArr생성
	//"JAVA","JSP","HTML","JavaScript" 정보를 저장하여 출력하라.
	// String[] strArr = new String[4]; 
	// strArr[0] = "JAVA";
	// strArr[1] = "JSP";
	// strArr[2] = "HTML";
	// strArr[3] = "JavaScript"; // 자바에서 어레이 선언할때 이렇게 함,, 밑에도 가능 !! 
	
	String[] strArr = {"JAVA","JSP","HTML","JavaScript"};
	//String strArr[] = ... 도 가능하지만, 가능한 한 String[]이 권장됨 !!
	for(int i=0;i<strArr.length;i++){
		System.out.println("strArr["+i+"] = "+strArr[i]);	//console 에 출력
// 		out.println("strArr["+i+"] = "+strArr[i]);	//document 에 출력 ,, 줄바꿈 x
		out.println("strArr["+i+"] = "+strArr[i]+"<br>");	//document 에 출력 br태그 추가해서 줄바꿈 !!
	};
	%>
	<hr>
	<h2>HTML코드</h2>
	<%
	//위 코드를 사용하기 좋게 변경하면
		for(int i=0;i<strArr.length;i++){
	%>	
		strArr[<%=i%>] = <%=strArr[i] %><br>
	<% 
	};
	//JSP와 같이 사용하면 HTML코드도 반복할 수 있다.
	// 장점 : JAVA의 데이터, HTML의 태그를 혼합하여 사용할 수 있다 !!
	%>
	


</body>
</html>