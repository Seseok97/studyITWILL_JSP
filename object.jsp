<%@page import="com.itwillbs.servlet.Phone"%>
<%@page import="com.itwillbs.servlet.Person"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>/el/object.jsp</h1>
<p>상속해서 진행</p>
<%
Person p = (Person)request.getAttribute("Person");
%>
<%=p.getName() %> <br>
<%=p.getModel() %><br>
<%=p.getTelNo() %><br>

${Person }			<br><!-- Person [name=홍길동, phone=null] >> phone이 같이 안넘어오는듯 -->
${Person.name }		<br>
${Person.phone }	<br><!--  출력안됨. null!! -->
${Person.model }	<br>
${Person.telNo }	<br> <!-- phone은 인스턴스생성을 별도로 하지 않아서, 이 페이지에는 아예 없음!
							   >> model, telNo는 Person 안에 멤버변수로 있는 상황이라서 호출 가능! -->
<br>
<h3>기존 해봤던 방식</h3>
User Info: ${p1 }<br>
User Name: ${p1.name }<br>

User's Phone Info: ${p1.phone}<br>
User's phone model: ${p1.phone.model }<br>
User's phonenumber: ${p1.phone.telNo }<br>

<!--  phone이라는 객체명은 전달하지 않았는데 어떻게 넘어왔나 ?
		일단, ${ } 안에 get/set 메서드가 있다고 보면 된다. 
			> 별도의 처리 없이 객체의 내용을 들고 올 수있다는 말.
		Person 클래스 안에 Phone타입 변수 phone을 가지고 있기 때문에 가능한 것! -->
		


</body>
</html>
