<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>/el/arrays.jsp</h1>
<h3>스크립틀릿</h3>
<%
String[] foods = (String[])request.getAttribute("foods");
%>
<%for(int i=0;i<foods.length;i++){%>
음식 <%=i %>번: <%=foods[i] %> <br>
<%}%>
String[] foods: <%=foods %><br>

<h3>EL 표현식</h3>
음식 0번: ${foods[0] }<br>
음식 1번: ${foods[1] }<br>
음식 2번: ${foods[2] }<br>
음식 3번: ${foods[3] }<br>
음식 4번: ${foods[4] }<br>
음식 5번: ${foods[5] }<br>
foods: ${foods }<br>

<hr>
<h2>ArrayList</h2>
<h3>스크립틀릿</h3>
<%
ArrayList sports = (ArrayList)request.getAttribute("sports");
%>
<%for(int i=0;i<sports.size();i++){%>
운동 <%=i %>번: <%=sports.get(i) %> <br>
<%}%>
ArrayList sports: <%=sports %><br>

<h3>EL 표현식</h3>
운동 0번: ${sports[0] }<br>
운동 1번: ${sports[1] }<br>
운동 2번: ${sports[2] }<br>
운동 3번: ${sports[3] }<br>
운동 4번: ${sports[4] }<br>
운동 5번: ${sports[5] }<br>
sports: ${sports }<br>

<p>String[] 과 ArrayList의 출력값이 다른 이유 <br>
>> ArrayList는 toString() 메서드를 상속하고 있기 때문 !! <br>
>> 메모리 주소를 보여주냐, 전체 값을 보여주냐를 다르게 설계 한 것 !!</p><br>













</body>
</html>