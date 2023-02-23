<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>testPro3.jsp</h1>
	<%
	//한글처리
	request.setCharacterEncoding("UTF-8");
	//정보저장
	//이름, 하고싶은말
	String name = request.getParameter("name");
	String msg = request.getParameter("msg");
	String gender = request.getParameter("gender");
	String hobby = request.getParameter("hobby");
// 	String[] 변수명 = request.getParameterValues(파라매터명); >> 배열로 생성시켜준다.
	String[] hobbys = request.getParameterValues("hobby");
	int classNo = Integer.parseInt(request.getParameter("classNo"));
	%>
	
	이름: <%=name %><br>
	하고싶은말: <textarea rows="3" cols="15"><%=msg %></textarea><br>
	성별: <%=gender %><br>
<%-- 	취미: <%=hobby %><br> 여러가지 항목을 표시할 수 없다  --%>

<%-- 	취미1: <%=hobby2[0] %> <br> --%>
<%-- 	취미2: <%=hobby2[1] %> <br> --%>
<%-- 	취미3: <%=hobby2[2] %> <br> 모든 항목을 선택하여야만 한다. --%>

	
	<%
	if(hobbys==null){
		out.print("취미를 선택해주세요.<br>");
	}else{
		for(int i =0;i<hobbys.length;i++){
			out.print("취미"+(i+1)+": "+ hobbys[i]+"<br>"); // 이 코드 하나만으로는 선택하지 않았을때 500에러 발생.
		}
	}// hobbys
	
	if(classNo>=1 && classNo<=4){
		out.print(classNo+"강의실<br>");
	}else{
		out.print("강의실을 선택해주세요.<br>");
	}//classNo
	%>

</body>
</html>