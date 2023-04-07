<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>paramTestPro.jsp</h1>

<%
request.setCharacterEncoding("UTF-8");

String id = request.getParameter("id");
int age = Integer.parseInt(request.getParameter("age"));
%>
<p>EL표현식을 활용하여 화면에 출력하기.</p>

PARAM(EL): ${param }<br>

<h3>ID</h3>
ID: <%=id %> <br>
ID(EL): ${param.id }<br>

<h3>AGE</h3>
AGE : <%=age %><br>
AGE+100 : <%=age+100 %><br>
AGE(EL): ${param.age }<br>
AGE+100(EL): ${param.age+100 }<br>
<!-- el표현식은 param데이터를 자동으로 캐스팅한다.(자동 형변환!) -->

<h3>MENU</h3>
MENU(EL): ${param.menu }<br>

<%
String menu1 = request.getParameter("menu");
String menu2 = request.getParameter("menu");
 %> 
Menu1 = <%=menu1 %>, Menu2 = <%=menu2 %>
<br>
<%
String[] menus= request.getParameterValues("menu");
%>
Menu1 = <%=menus[0] %>, Menu2 = <%=menus[1] %>

<br>
<h4>EL</h4>
menus: ${paramValues }<br>
<%-- Menu1(EL) : ${paramValues[0] }<br> --%>
<%-- Menu2(EL) : ${paramValues[1] }<br> --%>
Menu1(EL) : ${paramValues.menu[0] }<br>
Menu2(EL) : ${paramValues.menu[1] }<br>

<%
String[] hobbys = request.getParameterValues("hobbys");
%>

<h3>HOBBYS</h3>

HOBBY:  <%if(hobbys != null){
			for(int i=0;i<hobbys.length;i++){%>
			<br><%="취미"+(i+1)+": "+hobbys[i] %>
		<%}}%><br>
		
HOBBY(EL): ${paramValues.hobbys[0] }, ${paramValues.hobbys[1] }, ${paramValues.hobbys[2] }

		<h2>EL 표현식은 JSP 반복문을 통한 표현이 불가능하다.</h2>
		 <%if(hobbys != null){
			for(int i=0;i<hobbys.length;i++){%>
			<br>취미<%=(i+1) %>: ${paramValues.hobbys[i] }
		<%}}%><br>
		<h2>>> JSTL - foreach문 사용하여 반복할것임!</h2>






<!-- EL표현식의 null값은 공백으로 출력된다. -->



</body>
</html>